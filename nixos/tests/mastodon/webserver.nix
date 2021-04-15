import ../make-test-python.nix
  ({ pkgs, ... }:
    let
      certs = import ../common/acme/server/snakeoil-certs.nix;
      mastodonDomain = certs.domain;
    in
    {
      name = "mastodon-webserver";
      meta.maintainers = with pkgs.lib.maintainers; [ erictapen ];

      nodes.mastodon = { lib, ... }:
        {
          virtualisation.memorySize = 2048;

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
          };
        };

      nodes.client = { ... }:
        {
          security.pki.certificateFiles = [ certs.ca.cert ];
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
          # mastodon.log(mastodon.succeed(mastodon_cmd("tootctl settings registrations open")))
          # mastodon.succeed("curl http://localhost:55001/")
        '';
    })
