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
        virtualisation.memorySize = 4096;
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
          accesstomemory.phpPackage accesstomemory.phpPackage.packages.composer (phpunit.override { php = accesstomemory.phpPackage; })
        ];
        text = ''
          TEMP=$(mktemp -d)
          cd "$TEMP"
          cp -r ${pkgs.accesstomemory}/share/php/accesstomemory/* .
          chmod u+w -R .
          php -d memory_limit=4G \
            symfony tools:install \
            --database-host=localhost \
            --database-port=3306 \
            --database-name=accesstomemory \
            --database-user=accesstomemory \
            --database-password=password \
            --admin-email=admin@erictapen.name \
            --admin-username=admin \
            --admin-password=admin \
            --search-host=localhost \
            --search-port=9200 \
            --search-index=accesstomemory \
            --site-title=Test \
            --site-description="Test description" \
            --site-base-url="https://atom.erictapen.name" \
            --no-confirmation
          echo "Running atom unit tests..."
          composer test
        '';
      };
    in ''
      start_all()
      server.wait_for_unit("mysql.service")
      server.wait_for_unit("elasticsearch.service")
      server.wait_for_unit("phpfpm-accesstomemory.service")
      server.succeed("sudo -u accesstomemory ${lib.getExe runUnitTests}")
    '';
  }
)
