{ config, lib, pkgs, ... }:
{

  options.programs.passless.enable = lib.mkEnableOption "passless";

  config = lib.mkIf config.programs.passless.enable {
    users.groups.fido = { };

    boot.kernelModules = [ "uhid" ];

    services.udev.extraRules = ''
      KERNEL=="uhid", GROUP="fido", MODE="0660"
    '';

    environment.systemPackages = [ pkgs.passless ];

    # https://github.com/pando85/passless/blob/master/contrib/systemd/passless.service
    systemd.services.passless = {
      description = "Passless FIDO2 Software Authenticator";
      documentation = "https://github.com/pando85/passless";
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
      wantedBy = [ "default.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = lib.getExe pkgs.passless;
        Restart = "on-failure";
        RestartSec = "5s";
        # Security hardening
        # The application already handles its own memory locking and core dump prevention
        # but we can add additional systemd protections
        NoNewPrivileges=true;
        LimitMEMLOCK="2M";
        SyslogIdentifier="passless";
      };
    };
  };

}
