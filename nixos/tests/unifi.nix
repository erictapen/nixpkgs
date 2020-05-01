import ./make-test-python.nix ({ pkgs, ... }:

let
  httpPort = 8080;
  httpsPort = 18443;

in rec {
  name = "unifi";

  meta = with pkgs.stdenv.lib; {
    maintainers = with maintainers; [ peterhoeg ];
  };

  nodes = {
    server = { pkgs, ... }: {
      services.unifi = {
        enable = true;
        openPorts = true;
        unifiPackage = pkgs.unifiStable;
        inherit httpPort httpsPort;
      };
      nixpkgs.config.allowUnfree = true;
    };

    client = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [ curl ];
    };
  };

  testScript = ''
    start_all()

    server.wait_for_open_port(${toString httpPort})

    server.wait_until_succeeds("test -d /var/lib/unifi/data")
    server.wait_until_succeeds("test -d /var/lib/unifi/logs")
    server.wait_until_succeeds("test -d /var/lib/unifi/run")

    server.wait_until_succeeds("test -L /var/lib/unifi/webapps/ROOT")
    server.wait_until_succeeds("test -f /var/lib/unifi/data/system.properties")

    client.wait_until_succeeds("curl --insecure --silent https://server:${toString httpsPort}")
  '';
})
