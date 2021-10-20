{ config, pkgs, lib, ... }:
let
  cfg = config.services.kanidm;
  settingsFormat = pkgs.formats.toml { };
in
{

  options.services.kanidm = {
    enable = lib.mkEnableOption "kanidm service";

    ensureDomainName = lib.mkOption {
      description = ''
        The domain_name that Kanidm manages. It must be a descendant or equal to the domain
        specified in settings.origin. It is always set when the server starts up.
        While in theory it could be changed later, you should carefully consider these
        warnings:
        <link xlink:href="https://kanidm.github.io/kanidm/administrivia.html#rename-the-domain"/>
      '';
      example = "example.org";
      type = lib.types.str;
    };

    settings = lib.mkOption {
      type = lib.types.submodule {

        freeformType = settingsFormat.type;

        options.bindaddress = lib.mkOption {
          description = "Address/port combination the webserver binds to.";
          example = "[::1]:8443";
          type = lib.types.str;
        };
        options.origin = lib.mkOption {
          description = "The origin of your kanidm instance. Must have https as protocol.";
          example = "https://idm.example.org";
          type = lib.types.str;
        };
        options.db_path = lib.mkOption {
          description = "Path to kanidm database.";
          default = "/var/lib/kanidm/kanidm.db";
          type = lib.types.path;
        };
        options.log_level = lib.mkOption {
          description = "Log level of the server.";
          default = "default";
          type = lib.types.enum [ "default" "verbose" "perfbasic" "perffull" ];
        };
        options.role = lib.mkOption {
          description = "The role of this server. This affects features available and how replication may interact.";
          default = "WriteReplica";
          type = lib.types.enum [ "WriteReplica" "WriteReplicaNoUI" "ReadOnlyReplica" ];
        };

      };
      default = { };
      description = ''
        Settings for kanidm, see
        <link xlink:href="https://github.com/kanidm/kanidm/blob/master/examples/server.toml"/>
        for example config.
      '';
    };
  };

  config =
    lib.mkIf cfg.enable {

      systemd.services.kanidm = {
        description = "Kanidm server";
        after = [ "network.target" ];
        wantedBy = [ "multi-user.target" ];
        serviceConfig = {
          ExecPreStart = ''
            ${pkgs.kanidm}/bin/kanidmd domain_name_change \
              --config ${settingsFormat.generate "config.toml" cfg.settings} \
              -n ${cfg.ensureDomainName}
          '';
          ExecStart = ''
            ${pkgs.kanidm}/bin/kanidmd server \
              --config ${settingsFormat.generate "config.toml" cfg.settings}
          '';
          Restart = "always";
          StateDirectory = "kanidm";
          RuntimeDirectory = "kanidm";
          RuntimeDirectoryMode = "0700";
          User = "kanidm";
          Group = "kanidm";
        };
      };

      users.users.kanidm = {
        isSystemUser = true;
        group = "kanidm";
        packages = [ pkgs.kanidm ];
      };
      users.groups.kanidm = { };

    };

  meta.maintainers = with lib.maintainers; [ erictapen ];

}
