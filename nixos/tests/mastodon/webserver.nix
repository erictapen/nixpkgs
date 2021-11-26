import ../make-test-python.nix
  ({ pkgs, ... }:
    let
      certs = import ../common/acme/server/snakeoil-certs.nix;
      mastodonDomain = certs.domain;
      user = {
        name = "testuser1";
        email = "testuser1@example.org";
        password = "thisisnotasecretpassword";
        # htpasswd -Bbn usernameprefix thisisnotasecretpassword
        encryptedPassword = "$2y$05$E3XMpUTk77DP832axdgWmOoXJwNw7tC3WZy9xOJUzWYDa4B/.l1Hy";
      };
    in
    {
      name = "mastodon-webserver";
      meta.maintainers = with pkgs.lib.maintainers; [ erictapen ];

      nodes.mastodon = { lib, ... }:
        {
          virtualisation.memorySize = 2048;
          virtualisation.cores = 4;

          security.pki.certificateFiles = [ certs.ca.cert ];

          services.nginx.virtualHosts.${mastodonDomain} = {
            enableACME = lib.mkForce false;
            sslCertificate = certs.${mastodonDomain}.cert;
            sslCertificateKey = certs.${mastodonDomain}.key;
          };

          services.mastodon = {
            enable = true;
            configureNginx = true;
            localDomain = mastodonDomain;
            smtp = rec {
              fromAddress = "mail@${mastodonDomain}";
              user = fromAddress;
            };
            # Mastodon queries the MX record during account creation, except
            # when the email domain is configured in the allow list.
            extraConfig.EMAIL_DOMAIN_ALLOWLIST = "example.org";
          };
        };

      nodes.client = { ... }:
        {
          security.pki.certificateFiles = [ certs.ca.cert ];

          environment.systemPackages = with pkgs; [ toot ];
        };


      # What to test:
      # local db / remote db
      # local nginx / remote nginx
      # local redis / remote redis
      # local smtp / remote smtp
      #
      # secret auto generation
      testScript =
        ''
          def mastodon_cmd(cmd):
              return f'su - mastodon -s /bin/sh -c "mastodon-env {cmd}" | cat'


          start_all()
          mastodon.wait_for_unit("multi-user.target")
          mastodon.wait_for_file("/run/mastodon-web/web.socket")

          mastodon.succeed(mastodon_cmd("tootctl accounts create ${user.name} --email ${user.email} --confirmed --role admin"))
          mastodon.succeed("psql -d mastodon -c 'UPDATE users SET encrypted_password = \'${user.encryptedPassword}\' WHERE email = \'${user.email}\';'")

          client.wait_for_unit("multi-user.target")
          client.succeed("echo \"${user.password}\" | toot login_cli --instance ${mastodonDomain} --email ${user.email}")

          # todo: send confirmation email, curl the link in that email.
        '';
    })
