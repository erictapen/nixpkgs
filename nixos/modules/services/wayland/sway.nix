{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.services.sway;

in {

  options = {
    services.sway.enable = mkEnableOption "Sway systemd user service";
  };

  config = mkIf cfg.enable {
    environment = {
      etc = {
        "sway/config".source = pkgs.writeTextFile {
          name = "sway-config";
          # TODO one day we may validate the config via
          # sway --config $out --validate
          # but this is currently not possible in the Nix sandbox. See
          # https://github.com/swaywm/sway/issues/4691
          text = "text";
        };
        # "xdg/termite/config".source = ../dotfiles/termite;
        # "xdg/waybar/config".source = ../dotfiles/waybar/config;
        # "xdg/waybar/style.css".source = ../dotfiles/waybar/style.css;
      };
    };

    systemd.user.services.kanshi = {
      description = "Kanshi output autoconfig ";
      wantedBy = [ "graphical-session.target" ];
      partOf = [ "graphical-session.target" ];
      serviceConfig = {
        # kanshi doesn't have an option to specifiy a config file yet, so it
        # currently looks at .config/kanshi/config
        ExecStart = ''
          ${pkgs.kanshi}/bin/kanshi
        '';
        RestartSec = 5;
        Restart = "always";
      };
    };

    systemd.user.targets.sway-session = {
      description = "Sway compositor session";
      documentation = [ "man:systemd.special(7)" ];
      bindsTo = [ "graphical-session.target" ];
      wants = [ "graphical-session-pre.target" ];
      after = [ "graphical-session-pre.target" ];
    };

    systemd.user.services.sway = {
      description = "Sway - Wayland window manager";
      documentation = [ "man:sway(5)" ];
      bindsTo = [ "graphical-session.target" ];
      wants = [ "graphical-session-pre.target" ];
      after = [ "graphical-session-pre.target" ];
      # We explicitly unset PATH here, as we want it to be set by
      # systemctl --user import-environment in startsway
      environment.PATH = lib.mkForce null;
      serviceConfig = {
        Type = "simple";
        ExecStart = ''
          ${pkgs.dbus}/bin/dbus-run-session ${pkgs.sway}/bin/sway --debug
        '';
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };

    environment.systemPackages = with pkgs; [
      (
        pkgs.writeTextFile {
          name = "startsway";
          destination = "/bin/startsway";
          executable = true;
          text = ''
            #! ${pkgs.bash}/bin/bash

            # first import environment variables from the login manager
            systemctl --user import-environment
            # then start the service
            exec systemctl --user start sway.service
          '';
        }
      )
    ];

    hardware.opengl.enable = mkDefault true;

    services.redshift.package = pkgs.redshift-wlr;

  };

  meta.maintainers = with lib.maintainers; [ erictapen ];

}
