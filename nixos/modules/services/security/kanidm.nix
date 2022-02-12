{ config, lib, options, pkgs, ... }:
let
  cfg = config.services.kanidm;
  settingsFormat = pkgs.formats.toml { };
  serverConfigFile = settingsFormat.generate "server.toml" cfg.serverSettings;
  dummyServerConfigFile = settingsFormat.generate "server.toml" (cfg.serverSettings // { origin = "@origin@"; });
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
    enable = lib.mkEnableOption "the Kanidm server";
    enablePam = lib.mkEnableOption "the Kanidm client for PAM and NSS integration.";

    ensureDomainName = lib.mkOption {
      description = ''
        The <literal>domain_name</literal> that Kanidm manages. Must be below or equal to the domain
        specified in <literal>serverSettings.origin</literal>. Will always be set when the server starts up.
        While it is possible to change this setting later, carefully consider the warnings in the
        <link xlink:href="https://kanidm.github.io/kanidm/administrivia.html#rename-the-domain">relevant documentation</link>.
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
          # Should be optional but toml does not accept null
          /*ldapbindaddress = lib.mkOption {
            description = ''
              Address and port the LDAP server is bound to. Setting this to an empty string disables the LDAP interface.
            '';
            example = "[::1]:636";
            type = lib.types.str;
          };*/
          origin = lib.mkOption {
            description = "The origin of your Kanidm instance. Must have https as protocol.";
            example = "https://idm.example.org";
            type = lib.types.strMatching "^https://.*";
          };
          db_path = lib.mkOption {
            description = "Path to Kanidm database.";
            default = "/var/lib/kanidm/kanidm.db";
            readOnly = true;
            type = lib.types.path;
          };
          log_level = lib.mkOption {
            description = "Log level of the server.";
            default = "default";
            type = lib.types.enum [ "default" "verbose" "perfbasic" "perffull" ];
          };
          role = lib.mkOption {
            description = "The role of this server. This affects the replication relationship and thereby available features.";
            default = "WriteReplica";
            type = lib.types.enum [ "WriteReplica" "WriteReplicaNoUI" "ReadOnlyReplica" ];
          };
        };
      };
      default = { };
      description = ''
        Settings for Kanidm, see
        <link xlink:href="https://github.com/kanidm/kanidm/blob/master/kanidm_book/src/server_configuration.md">the documentation</link>
        and <link xlink:href="https://github.com/kanidm/kanidm/blob/master/examples/server.toml">example configuration</link>
        for possible values.
      '';
    };

    clientSettings = lib.mkOption {
      type = lib.types.submodule {
        freeformType = settingsFormat.type;

        options.uri = lib.mkOption {
          description = "Address of the Kanidm server.";
          example = "http://127.0.0.1:8080";
          type = lib.types.str;
        };
      };
      description = ''
        Configure Kanidm clients, needed for the PAM daemon. See
        <link xlink:href="https://github.com/kanidm/kanidm/blob/master/kanidm_book/src/client_tools.md#kanidm-configuration">the documentation</link>
        and <link xlink:href="https://github.com/kanidm/kanidm/blob/master/examples/config">example configuration</link>
        for possible values.
      '';
    };

    unixSettings = lib.mkOption {
      type = lib.types.submodule {
        freeformType = settingsFormat.type;

        options.pam_allowed_login_groups = lib.mkOption {
          description = "Kanidm groups that are allowed to login using PAM.";
          example = "my_pam_group";
          type = lib.types.listOf lib.types.str;
        };
      };
      description = ''
        Configure Kanidm unix daemon.
        See <link xlink:href="https://github.com/kanidm/kanidm/blob/master/kanidm_book/src/pam_and_nsswitch.md#the-unix-daemon">the documentation</link>
        and <link xlink:href="https://github.com/kanidm/kanidm/blob/master/examples/unixd">example configuration</link>
        for possible values.
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
            for the PAM daemon to connect to the Kanidm server.
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

    environment.systemPackages = [ pkgs.kanidm ];

    systemd.services.kanidm = lib.mkIf cfg.enable {
      description = "kanidm identity management daemon";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      serviceConfig = defaultServiceConfig // {
        StateDirectory = "kanidm";
        StateDirectoryMode = "0700";
        ExecStart = "${pkgs.kanidm}/bin/kanidmd server -c ${serverConfigFile}";
        # There is currently no nice way to set the domain name, because origin
        # in the config needs to be consistent with the current domain name:
        # https://github.com/kanidm/kanidm/issues/623
        ExecStartPre = pkgs.writeShellScript "kanidm-start-pre.sh" ''
          set -euo pipefail
          umask 077
          PATH=${lib.makeBinPath (with pkgs; [ coreutils gawk gnugrep gnused ])}
          log="$(mktemp)"
          # Try to set domain name
          ${pkgs.kanidm}/bin/kanidmd domain_name_change \
            -c ${serverConfigFile} \
            -n ${cfg.ensureDomainName} | tee "$log"
          # Exit status is always 0, so search for error messages
          if grep -q 'admin.error' "$log"; then
            # If it failed, extract the old domain name and create a temporary config
            olddomain="$(awk 'match($0, /rp_id: "(.*)"/, m) { print m[1] }' "$log")"
            rm "$log"

            echo "Using temporary config with old domain name '$olddomain'"
            # Create temporary config with old domain name
            config="$(mktemp)"
            sed ${dummyServerConfigFile} -e "s#@origin@#https://$olddomain#" > "$config"
            ${pkgs.kanidm}/bin/kanidmd domain_name_change \
              -c "$config" \
              -n ${cfg.ensureDomainName}
            rm "$config"
          fi
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
      description = "Kanidm PAM daemon";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      restartTriggers = [ unixConfigFile clientConfigFile ];
      serviceConfig = defaultServiceConfig // {
        CacheDirectory = "kanidm-unixd";
        CacheDirectoryMode = "0700";
        RuntimeDirectory = "kanidm-unixd";
        ExecStart = "${pkgs.kanidm}/bin/kanidm_unixd";
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
      description = "Kanidm PAM home management daemon";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" "kanidm-unixd.service" ];
      partOf = [ "kanidm-unixd.service" ];
      restartTriggers = [ unixConfigFile clientConfigFile ];
      serviceConfig = {
        ExecStart = "${pkgs.kanidm}/bin/kanidm_unixd_tasks";

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

    system.nssModules = lib.mkIf cfg.enablePam [ pkgs.kanidm ];

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
          description = "Kanidm server";
          isSystemUser = true;
          group = "kanidm";
        };
      })
      (lib.mkIf cfg.enablePam {
        kanidm-unixd = {
          description = "Kanidm PAM daemon";
          isSystemUser = true;
          group = "kanidm-unixd";
        };
      })
    ];
  };

  meta.maintainers = with lib.maintainers; [ erictapen Flakebi ];
  meta.buildDocsInSandbox = false;

}
