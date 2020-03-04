import ./make-test-python.nix ({ pkgs, ...} :

{
  name = "sway";
  meta = with pkgs.stdenv.lib.maintainers; {
    maintainers = [ erictapen ];
  };

  machine = { ... }:

  {
    imports = [ ./common/user-account.nix ];
    services.sway = {
      enable = true;
    };

    virtualisation.memorySize = 1024;
  };

  enableOCR = true;

  testScript = { nodes, ... }: let
    user = nodes.machine.config.users.users.alice;
  in ''
    with subtest("Wait for sway to start"):
        start_all()
        machine.execute("su - ${user.name} -c 'startsway'")
        machine.wait_for_unit("sway.service", "${user.name}")
        machine.screenshot("screen")
  '';
})
