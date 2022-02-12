import ./make-test-python.nix ({ pkgs, ... }:
  let
    certs = import ./common/acme/server/snakeoil-certs.nix;
    serverDomain = certs.domain;
  in
  {
    name = "kanidm";
    meta.maintainers = with pkgs.lib.maintainers; [ erictapen Flakebi ];

    nodes.server = { config, pkgs, lib, ... }: {
      services.kanidm = {
        enable = true;
        ensureDomainName = serverDomain;
        serverSettings = {
          origin = "https://${serverDomain}";
          bindaddress = "[::1]:8443";
        };
      };

      services.nginx = {
        enable = true;
        recommendedProxySettings = true;
        virtualHosts."${serverDomain}" = {
          forceSSL = true;
          sslCertificate = certs."${serverDomain}".cert;
          sslCertificateKey = certs."${serverDomain}".key;
          locations."/".proxyPass = "http://[::1]:8443";
        };
      };

      security.pki.certificateFiles = [ certs.ca.cert ];

      networking.hosts."::1" = [ serverDomain ];
      networking.firewall.allowedTCPPorts = [ 80 443 ];

      users.users.kanidm.shell = pkgs.bashInteractive;
    };

    nodes.client = { pkgs, nodes, ... }: {
      environment.systemPackages = [ pkgs.kanidm ];

      environment.etc."kanidm/config".text = ''
        uri = "https://${serverDomain}"
      '';

      networking.hosts."${nodes.server.config.networking.primaryIPAddress}" = [ serverDomain ];

      security.pki.certificateFiles = [ certs.ca.cert ];
    };

    testScript = ''
      start_all()
      server.wait_for_unit("kanidm.service")
      server.wait_until_succeeds("curl -sf https://${serverDomain} | grep Kanidm")
      client.wait_until_succeeds("kanidm login -D anonymous && kanidm self whoami | grep anonymous@${serverDomain}")
    '';
  })
