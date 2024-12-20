{ config, pkgs, lib, ... }:
let
  inherit (lib) mkEnableOption mkOption mapAttrs mkDefault;
  cfg = config.services.accesstomemory;
  fpm = config.services.phpfpm.pools.accesstomemory;
  package = pkgs.accesstomemory;
  format = pkgs.formats.php { };
  configPhp = format.generate "config.php" {
    all.propel = {
      class = "sfPropelDatabase";
      param = {
        encoding = "utf8mb4";
        persistent = true;
        pooling = true;
        dsn = "mysql:dbname=accesstomemory;port=3306";
        username = "accesstomemory";
        password = "password";
      };
    };
  };
  webroot = pkgs.runCommand "accesstomemory-webroot" ''
    mkdir -p $out
    cp -r ${package}/share/php/accesstomemory/* $out/
    ln -s ${configPhp} $out/config/config.php
  '';
in {
  options.services.accesstomemory = {
    enable = mkEnableOption "Access to Memory (AtoM) service";
    domain = lib.mkOption {
      description = "The domain name serving your AtoM instance.";
      example = "atom.example.org";
      type = lib.types.str;
    };
  };

  config = lib.mkIf cfg.enable {

    services.mysql = {
      enable = true;
      settings.mysqld = {
        sql_mode = "ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION";
        optimizer_switch = "'block_nested_loop=off'";
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
    # services.elasticsearch.enable = true;

    # services.gearman.enable = true;

    users.users.accesstomemory = {
      isSystemUser = true;
      group = "accesstomemory";
      packages = with pkgs; [
        fop imagemagick ghostscript
        ffmpeg
        # poppler-utils

        # Only for development of the module
        accesstomemory.phpPackage.packages.composer phpunit accesstomemory.phpPackage
      ];
    };
    users.groups.accesstomemory = {};

    services.phpfpm.pools.accesstomemory = {
      user = "accesstomemory";
      group = "accesstomemory";
      inherit (package) phpPackage;
      phpEnv = { };
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

    services.nginx.enable = true;
    # https://www.accesstomemory.org/en/docs/2.8/admin-manual/installation/ubuntu/#nginx
    services.nginx.virtualHosts."${cfg.domain}" = {
      root = "/var/lib/accesstomemory";
      extraConfig = ''
        client_max_body_size 72M;
      '';
      locations = {
        "~* ^/(css|dist|js|images|plugins|vendor)/.*\\.(css|png|jpg|js|svg|ico|gif|pdf|woff|ttf)$" = {
          root = package;
        };
        "~* ^/(downloads)/.*\\.(pdf|xml|html|csv|zip|rtf)$" = {};
        "~ ^/(ead.dtd|favicon.ico|robots.txt|sitemap.*)$" = {};
        "/" = {
          tryFiles = "$uri /index.php?$args";
          extraConfig = ''
            if (-f $request_filename) {
              return 403;
            }
          '';
        };
        "~* /uploads/r/(.*)/conf/" = {};
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

    # php symfony tools:install --database-host=localhost --database-port=3306 --database-name=accesstomemory --database-user=accesstomemory --database-password=password --admin-email=admin@erictapen.name --admin-username=admin --admin-password=admin

  };
}
