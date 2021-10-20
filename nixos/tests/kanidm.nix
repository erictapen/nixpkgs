import ./make-test-python.nix ({ pkgs, ... }:
  let
    certs = import ./common/acme/server/snakeoil-certs.nix;
    serverDomain = certs.domain;
    admin = {
      username = "admin";
      password = "snakeoilpass";
    };
  in
  {
    name = "kanidm";
    meta.maintainers = with pkgs.lib.maintainers; [ erictapen ];

    nodes.server = { config, pkgs, lib, ... }: {

      services.kanidm = {
        enable = true;
        ensureDomainName = serverDomain;
        settings = {
          domain_name = serverDomain;
          origin = "https://idm.${serverDomain}";
          bindaddress = "[::1]:8443";
        };
      };

      services.nginx.virtualHosts."${serverDomain}" = {
        enableACME = lib.mkForce false;
        sslCertificate = certs."${serverDomain}".cert;
        sslCertificateKey = certs."${serverDomain}".key;
      };

      security.pki.certificateFiles = [ certs.ca.cert ];

      networking.hosts."::1" = [ "${serverDomain}" ];
      networking.firewall.allowedTCPPorts = [ 80 443 ];

      environment.systemPackages = [ pkgs.kanidm ];
      users.users.kanidm.shell = pkgs.bashInteractive;
    };

    nodes.client = { pkgs, nodes, ... }: {
      environment.systemPackages = [ pkgs.kanidm ];

      environment.etc."kanidm/config".text = ''
        uri = "https://${serverDomain}"
        verify_ca = true
        verify_hostnames = true
      '';

      networking.hosts."${nodes.server.config.networking.primaryIPAddress}" = [ "${serverDomain}" ];

      security.pki.certificateFiles = [ certs.ca.cert ];
    };

    testScript = ''
      start_all()
      server.wait_for_unit("kanidm.service")
    '';
  })
