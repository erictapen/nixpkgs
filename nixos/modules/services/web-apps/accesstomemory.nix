{
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (lib)
    mkEnableOption
    mkOption
    types
    mapAttrs
    mkDefault
    ;
  cfg = config.services.accesstomemory;
  fpm = config.services.phpfpm.pools.accesstomemory;
  package = pkgs.accesstomemory;
  format = pkgs.formats.php { };
  # configPhp = format.generate "config.php" {
  #   all.propel = {
  #     class = "sfPropelDatabase";
  #     param = {
  #       encoding = "utf8mb4";
  #       persistent = true;
  #       pooling = true;
  #       dsn = "mysql:dbname=accesstomemory;port=3306";
  #       username = "accesstomemory";
  #       password = "password";
  #     };
  #   };
  # };
in
{
  options.services.accesstomemory = {
    enable = mkEnableOption "Access to Memory (AtoM) service";
    domain = mkOption {
      description = "The domain name serving your AtoM instance.";
      example = "atom.example.org";
      type = types.str;
    };
    title = mkOption {
      description = "Site title";
      example = "AtoM";
      type = types.str;
    };
    description = mkOption {
      description = "Site description";
      example = "AtoM - Access to Memory";
      type = types.str;
    };
    admin.username = mkOption {
      description = "The admin username";
      default = "admin";
      type = types.str;
    };
    admin.passwordFile = mkOption {
      description = "File containing the admin password";
      type = types.path;
    };
    admin.email = mkOption {
      description = "The admin email address";
      example = "admin@example.org";
      type = types.str;
    };
  };

  config = lib.mkIf cfg.enable {

    services.mysql = {
      enable = true;
      settings.mysqld = {
        sql_mode = "ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION";
        optimizer_switch = "'block_nested_loop=off'";
        bind-address = "127.0.0.1";
      };
      # Recommended by upstream
      # https://www.accesstomemory.org/en/docs/2.8/admin-manual/installation/ubuntu/#mysql
      package = pkgs.percona-server_8_0;
      ensureDatabases = [ "accesstomemory" ];
      ensureUsers = [
        {
    name = "accesstomemory";
    ensurePermissions = {
      "accesstomemory.*" = "ALL PRIVILEGES";
    };
  }
      ];
    };

    # unfree
    services.elasticsearch.enable = true;
    services.elasticsearch.package = pkgs.elasticsearch6;

    services.gearmand.enable = true;

    users.users.accesstomemory = {
      isSystemUser = true;
      group = "accesstomemory";
      home = "/var/lib/accesstomemory";
      packages = with pkgs; [
        fop
        imagemagick
        ghostscript
        ffmpeg
        # poppler-utils

        # Only for development of the module
        package.phpPackage
        package.phpPackage.packages.composer
        (phpunit.override { php = package.phpPackage; })
      ];
    };
    users.groups.accesstomemory = { };

    systemd.services.accesstomemory-install = {
      description = "Accesstomemory install";
      after = [ "network.target" ];
      path = [
        package.phpPackage
      ];
      serviceConfig = {
        Type = "oneshot";
        StateDirectory = "accesstomemory";
        WorkingDirectory = "/var/lib/accesstomemory";
        User = "accesstomemory";
        Group = "accesstomemory";
      };
      script = ''
        # Delete everything and install again for now
        rm -rf *
        cp -r ${package}/share/php/accesstomemory/* .
        chmod u+w -R .
        php -d memory_limit=4G \
          symfony tools:install \
          --database-host=localhost \
          --database-port=9999 \
          --database-name=accesstomemory \
          --database-user=accesstomemory \
          --database-password=password \
          --admin-email='${cfg.admin.email}' \
          --admin-username='${cfg.admin.username}' \
          --admin-password="$(cat ${cfg.admin.passwordFile})" \
          --search-host=localhost \
          --search-port=${toString config.services.elasticsearch.port} \
          --search-index=accesstomemory \
          --site-title='${cfg.title}' \
          --site-description='${cfg.description}' \
          --site-base-url='https://${cfg.domain}' \
          --no-confirmation
        # The install script doesn't natively support unix socket connection for the db
        sed -i "s|'dsn' => 'mysql:dbname=accesstomemory;port=9999',|'dsn' => 'mysql:unix_socket=/run/mysqld/mysqld.sock;dbname=accesstomemory',|g" config/config.php
        sed -i 's|default: 127.0.0.1:4730|default: 127.0.0.1:${toString config.services.gearmand.port}|g' config/gearman.yml
      '';
      restartTriggers = [ package ];
    };

    systemd.services.accesstomemory-worker = {
      description = "Accesstomemory worker";
      after = [
        "network.target"
        "accesstomemory-install.service"
        "elasticsearch.service"
        "mysql.service"
        "gearmand.service"
      ];
      requires = [ "accesstomemory-install.service" ];
      restartTriggers = [ package ];
      serviceConfig = {
        Type = "simple";
        StateDirectory = "accesstomemory";
        WorkingDirectory = "/var/lib/accesstomemory";
        User = "accesstomemory";
        Group = "accesstomemory";
        ExecStart = ''
          ${lib.getExe package.phpPackage} \
            -d memory_limit=-1 \
            -d error_reporting="E_ALL" \
            symfony \
            jobs:worker
        '';
      };
      unitConfig = {
        # High interval and low restart limit to increase the possibility
        # of hitting the rate limits in long running recurrent jobs.
        StartLimitIntervalSec = "24h";
        StartLimitBurst = "3";
      };
    };

    services.phpfpm.pools.accesstomemory = {
      user = "accesstomemory";
      group = "accesstomemory";
      inherit (package) phpPackage;
      phpEnv = { };
      phpOptions = ''
        memory_limit = 512M
      '';
      settings = mapAttrs (name: mkDefault) {
        "listen.owner" = config.services.nginx.user;
        "listen.group" = config.services.nginx.group;

        # https://www.accesstomemory.org/en/docs/2.8/admin-manual/installation/ubuntu/#php-fpm
        "pm" = "dynamic";
        "pm.max_children" = "30";
        "pm.start_servers" = "10";
        "pm.min_spare_servers" = "10";
        "pm.max_spare_servers" = "10";
        "pm.max_requests" = "200";
      };
    };
    systemd.services.phpfpm-accesstomemory = {
      requires = [ "accesstomemory-install.service" ];
      wants = [ "accesstomemory-worker.service" ];
      after = [
        "accesstomemory-install.service"
        "elasticsearch.service"
        "mysql.service"
      ];
      restartTriggers = [ package ];
    };

    services.nginx.enable = true;
    # https://www.accesstomemory.org/en/docs/2.8/admin-manual/installation/ubuntu/#nginx
    services.nginx.virtualHosts."${cfg.domain}" = {
      root = "/var/lib/accesstomemory";
      extraConfig = ''
        client_max_body_size 72M;
      '';
      locations = {
        "~* ^/(css|dist|js|images|plugins|vendor)/.*\\.(css|png|jpg|js|svg|ico|gif|pdf|woff|woff2|ttf)$" = {
          root = "/var/lib/accesstomemory";
        };
        "~* ^/(downloads)/.*\\.(pdf|xml|html|csv|zip|rtf)$" = { };
        "~ ^/(ead.dtd|favicon.ico|robots.txt|sitemap.*)$" = { };
        "/" = {
          tryFiles = "$uri /index.php?$args";
          extraConfig = ''
            if (-f $request_filename) {
              return 403;
            }
          '';
        };
        "~* /uploads/r/(.*)/conf/" = { };
        "~* ^/uploads/r/(.*)$" = {
          extraConfig = ''
            include ${config.services.nginx.package}/conf/fastcgi.conf;
            set $index /index.php;
            fastcgi_param SCRIPT_FILENAME $document_root$index;
            fastcgi_param SCRIPT_NAME $index;
            fastcgi_pass unix:${fpm.socket};
          '';
        };
        "~ ^/private/(.*)$" = {
          extraConfig = ''
            internal;
            alias /var/lib/accesstomemory/$1;
          '';
        };
        "~ ^/(index|qubit_dev)\\.php(/|$)" = {
          extraConfig = ''
            include ${config.services.nginx.package}/conf/fastcgi.conf;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            fastcgi_split_path_info ^(.+\.php)(/.*)$;
            fastcgi_pass unix:${fpm.socket};
          '';
        };
      };
      forceSSL = true;
      enableACME = true;
    };

  };
}
