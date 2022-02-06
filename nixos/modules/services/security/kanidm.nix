{ config, lib, options, pkgs, ... }:
let
  cfg = config.services.kanidm;
  settingsFormat = pkgs.formats.toml { };
  serverConfigFile = settingsFormat.generate "server.toml" cfg.serverSettings;
  clientConfigFile = settingsFormat.generate "kanidm-config.toml" cfg.clientSettings;
  unixConfigFile = settingsFormat.generate "kanidm-unixd.toml" cfg.unixSettings;

  defaultServiceConfig = {
    BindReadOnlyPaths = [
      "/nix/store"
      "-/etc/resolv.conf"
      "-/etc/nsswitch.conf"
      "-/etc/hosts"
      "-/etc/localtime"
    ];
    CapabilityBoundingSet = "";
    # ProtectClock= adds DeviceAllow=char-rtc r
    DeviceAllow = "";
    # Implies ProtectSystem=strict, which re-mounts all paths
    #DynamicUser = true;
    LockPersonality = true;
    MemoryDenyWriteExecute = true;
    NoNewPrivileges = true;
    PrivateDevices = true;
    PrivateMounts = true;
    PrivateNetwork = true;
    PrivateTmp = true;
    PrivateUsers = true;
    ProcSubset = "pid";
    ProtectClock = true;
    ProtectHome = true;
    ProtectHostname = true;
    # Would re-mount paths ignored by temporary root
    #ProtectSystem = "strict";
    ProtectControlGroups = true;
    ProtectKernelLogs = true;
    ProtectKernelModules = true;
    ProtectKernelTunables = true;
    ProtectProc = "invisible";
    RestrictAddressFamilies = [ ];
    RestrictNamespaces = true;
    RestrictRealtime = true;
    RestrictSUIDSGID = true;
    SystemCallArchitectures = "native";
    SystemCallFilter = [ "@system-service" "~@privileged @resources @setuid @keyring" ];
    # Does not work well with the temporary root
    #UMask = "0066";
  };

in
{
  options.services.kanidm = {
    enable = lib.mkEnableOption "the kanidm server";
    enablePam = lib.mkEnableOption "the pam and nsswitch integration of kanidm";

    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.kanidm;
      description = "Which kanidm package to use.";
    };

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

    serverSettings = lib.mkOption {
      type = lib.types.submodule {
        freeformType = settingsFormat.type;

        options = {
          bindaddress = lib.mkOption {
            description = "Address/port combination the webserver binds to.";
            example = "[::1]:8443";
            type = lib.types.str;
          };
          ldapbindaddress = lib.mkOption {
            description = "Address/port combination the emulated ldap server binds to.";
            example = "[::1]:389";
            default = "";
            type = lib.types.str;
          };
          origin = lib.mkOption {
            description = "The origin of your kanidm instance. Must have https as protocol.";
            example = "https://idm.example.org";
            type = lib.types.str;
          };
          db_path = lib.mkOption {
            description = "Path to kanidm database.";
            default = "/var/lib/kanidm/kanidm.db";
            type = lib.types.path;
          };
          log_level = lib.mkOption {
            description = "Log level of the server.";
            default = "default";
            type = lib.types.enum [ "default" "verbose" "perfbasic" "perffull" ];
          };
          role = lib.mkOption {
            description = "The role of this server. This affects features available and how replication may interact.";
            default = "WriteReplica";
            type = lib.types.enum [ "WriteReplica" "WriteReplicaNoUI" "ReadOnlyReplica" ];
          };
        };
      };
      default = { };
      description = ''
        Settings for kanidm, see
        <link xlink:href="https://github.com/kanidm/kanidm/blob/master/kanidm_book/src/server_configuration.md">the documentation</link>
        and <link xlink:href="https://github.com/kanidm/kanidm/blob/master/examples/server.toml"/>
        for the example config.
      '';
    };

    clientSettings = lib.mkOption {
      type = lib.types.submodule {
        freeformType = settingsFormat.type;

        options.uri = lib.mkOption {
          description = "Address of the kanidm server.";
          example = "http://127.0.0.1:8080";
          type = lib.types.str;
        };
      };
      description = ''
        Configure kanidm clients, needed for the PAM daemon.
        See <link xlink:href="https://github.com/kanidm/kanidm/blob/master/kanidm_book/src/client_tools.md#kanidm-configuration">the documentation</link>
        for possible settings.
      '';
    };

    unixSettings = lib.mkOption {
      type = lib.types.submodule {
        freeformType = settingsFormat.type;

        options.pam_allowed_login_groups = lib.mkOption {
          description = "kanidm group that is allowed to login in PAM";
          example = "my_pam_group";
          type = lib.types.listOf lib.types.str;
        };
      };
      description = ''
        Configure kanidm unix daemon.
        See <link xlink:href="https://github.com/kanidm/kanidm/blob/master/kanidm_book/src/pam_and_nsswitch.md#the-unix-daemon">the documentation</link>
        for possible settings.
      '';
    };
  };

  config = lib.mkIf (cfg.enable || cfg.enablePam) {
    assertions =
      [
        {
          assertion = !cfg.enable || ((cfg.serverSettings.tls_chain or null) == null) || (!lib.isStorePath cfg.serverSettings.tls_chain);
          message = ''
            <option>services.kanidm.serverSettings.tls_chain</option> points to
            a file in the Nix store. You should use a quoted absolute path to
            prevent this.
          '';
        }
        {
          assertion = !cfg.enable || ((cfg.serverSettings.tls_key or null) == null) || (!lib.isStorePath cfg.serverSettings.tls_key);
          message = ''
            <option>services.kanidm.serverSettings.tls_key</option> points to
            a file in the Nix store. You should use a quoted absolute path to
            prevent this.
          '';
        }
        {
          assertion = !cfg.enablePam || options.services.kanidm.clientSettings.isDefined;
          message = ''
            <option>services.kanidm.clientSettings</option> needs to be configured
            for the PAM daemon to connect to the kanidmd server.
          '';
        }
        {
          assertion = !cfg.enable || (isNull cfg.ensureDomainName
            -> cfg.settings.role == "WriteReplica" || cfg.settings.role == "WriteReplicaNoUI");
          message = ''
            <option>services.kanidm.ensureDomainName</option> can only be set if this instance
            is not a ReadOnlyReplica. Otherwise the db would inherit it from
            the instance it follows.
          '';
        }
      ];

    environment.systemPackages = [ cfg.package ];

    systemd.services.kanidm = lib.mkIf cfg.enable {
      description = "kanidm identity management daemon";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      serviceConfig = defaultServiceConfig // {
        StateDirectory = "kanidm";
        StateDirectoryMode = "0700";
        ExecStart = "${cfg.package}/bin/kanidmd server -c ${serverConfigFile}";
        ExecPreStart = ''
          ${cfg.package}/bin/kanidmd domain_name_change \
            -c ${serverConfigFile} \
            -n ${cfg.ensureDomainName}
        '';
        User = "kanidm";
        Group = "kanidm";

        AmbientCapabilities = "CAP_NET_BIND_SERVICE";
        CapabilityBoundingSet = "CAP_NET_BIND_SERVICE";
        # Port needs to be exposed to the host network
        PrivateNetwork = false;
        RestrictAddressFamilies = [ "AF_INET" "AF_INET6" ];
        TemporaryFileSystem = "/:ro";
      };
      environment.RUST_LOG = "info";
    };

    systemd.services.kanidm-unixd = lib.mkIf cfg.enablePam {
      description = "kanidm PAM daemon";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      restartTriggers = [ unixConfigFile clientConfigFile ];
      serviceConfig = defaultServiceConfig // {
        CacheDirectory = "kanidm-unixd";
        CacheDirectoryMode = "0700";
        RuntimeDirectory = "kanidm-unixd";
        ExecStart = "${cfg.package}/bin/kanidm_unixd";
        User = "kanidm-unixd";
        Group = "kanidm-unixd";

        BindReadOnlyPaths = [
          "/nix/store"
          "-/etc/resolv.conf"
          "-/etc/nsswitch.conf"
          "-/etc/hosts"
          "-/etc/localtime"
          "-/etc/kanidm"
          "-/etc/static/kanidm"
        ];
        BindPaths = [
          # To create the socket
          "/run/kanidm-unixd:/var/run/kanidm-unixd"
        ];
        # Needs to connect to kanidmd
        PrivateNetwork = false;
        RestrictAddressFamilies = [ "AF_INET" "AF_INET6" "AF_UNIX" ];
        TemporaryFileSystem = "/:ro";
      };
      environment.RUST_LOG = "info";
    };

    systemd.services.kanidm-unixd-tasks = lib.mkIf cfg.enablePam {
      description = "kanidm PAM home management daemon";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" "kanidm-unixd.service" ];
      partOf = [ "kanidm-unixd.service" ];
      restartTriggers = [ unixConfigFile clientConfigFile ];
      serviceConfig = {
        ExecStart = "${cfg.package}/bin/kanidm_unixd_tasks";

        BindReadOnlyPaths = [
          "/nix/store"
          "-/etc/resolv.conf"
          "-/etc/nsswitch.conf"
          "-/etc/hosts"
          "-/etc/localtime"
          "-/etc/kanidm"
          "-/etc/static/kanidm"
        ];
        BindPaths = [
          # To manage home directories
          "/home"
          # To connect to kanidm-unixd
          "/run/kanidm-unixd:/var/run/kanidm-unixd"
        ];
        # CAP_DAC_OVERRIDE is needed to ignore ownership of unixd socket
        CapabilityBoundingSet = [ "CAP_CHOWN" "CAP_FOWNER" "CAP_DAC_OVERRIDE" "CAP_DAC_READ_SEARCH" ];
        IPAddressDeny = "any";
        # Need access to users
        PrivateUsers = false;
        # Need access to home directories
        ProtectHome = false;
        RestrictAddressFamilies = [ "AF_UNIX" ];
        TemporaryFileSystem = "/:ro";
      };
      environment.RUST_LOG = "info";
    };

    # These paths are hardcoded
    environment.etc = lib.mkMerge [
      (lib.mkIf options.services.kanidm.clientSettings.isDefined {
        "kanidm/config".source = clientConfigFile;
      })
      (lib.mkIf cfg.enablePam {
        "kanidm/unixd".source = unixConfigFile;
      })
    ];

    system.nssModules = lib.mkIf cfg.enablePam [ cfg.package ];

    system.nssDatabases.group = lib.optional cfg.enablePam "kanidm";
    system.nssDatabases.passwd = lib.optional cfg.enablePam "kanidm";

    users.groups = lib.mkMerge [
      (lib.mkIf cfg.enable {
        kanidm = {};
      })
      (lib.mkIf cfg.enablePam {
        kanidm-unixd = {};
      })
    ];
    users.users = lib.mkMerge [
      (lib.mkIf cfg.enable {
        kanidm = {
          description = "kanidm server";
          isSystemUser = true;
          group = "kanidm";
        };
      })
      (lib.mkIf cfg.enablePam {
        kanidm-unixd = {
          description = "kanidm PAM daemon";
          isSystemUser = true;
          group = "kanidm-unixd";
        };
      })
    ];
  };

  meta.maintainers = with lib.maintainers; [ erictapen Flakebi ];
}
