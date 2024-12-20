import ../make-test-python.nix (
  { lib, pkgs, ... }:

  let
    certs = import ../common/acme/server/snakeoil-certs.nix;

    serverDomain = certs.domain;
  in
  {
    name = "accesstomemory";
    meta.maintainers = with pkgs.lib.maintainers; [ erictapen ];

    nodes.server =
      { pkgs, lib, ... }:
      {
        services.accesstomemory = {
          enable = true;
          domain = "${serverDomain}";
        };

        services.nginx.virtualHosts."${serverDomain}" = {
          enableACME = lib.mkForce false;
          sslCertificate = certs."${serverDomain}".cert;
          sslCertificateKey = certs."${serverDomain}".key;
        };

        security.pki.certificateFiles = [ certs.ca.cert ];

        networking.hosts."::1" = [ "${serverDomain}" ];
        networking.firewall.allowedTCPPorts = [
          80
          443
        ];

        users.users.accesstomemory = {
          shell = pkgs.bashInteractive;
          packages = with pkgs; [];
        };
      };

    nodes.client =
      { pkgs, nodes, ... }:
      {
        networking.hosts."${nodes.server.networking.primaryIPAddress}" = [ "${serverDomain}" ];

        security.pki.certificateFiles = [ certs.ca.cert ];
      };

    testScript = let
      # Unit tests need a running database
      runUnitTests = pkgs.writeShellApplication {
        name = "run-unit-tests";
        runtimeInputs = with pkgs; [
          accesstomemory.phpPackage.packages.composer phpunit
        ];
        text = ''
          TEMP=$(mktemp -d)
          cd "$TEMP"
          cp -r ${pkgs.accesstomemory}/share/php/accesstomemory/* .
          chmod u+w -R .
          composer test
        '';
      };
    in ''
      start_all()
      server.wait_for_unit("mysql.service")
      server.wait_for_unit("phpfpm-accesstomemory.service")
      server.succeed("sudo -u accesstomemory ${lib.getExe runUnitTests}")
    '';
  }
)
