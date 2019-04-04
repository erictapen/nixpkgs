{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.mastodon;

  # this could be generated with
  # RAILS_ENV=production bundle exec rake mastodon:setup
  "env-production" = builtins.toFile "env.production" ''
    # Service dependencies
    # You may set REDIS_URL instead for more advanced options
    # You may also set REDIS_NAMESPACE to share Redis between multiple Mastodon servers
    REDIS_HOST=127.0.0.1
    REDIS_PORT=${toString config.services.redis.port}
    # You may set DATABASE_URL instead for more advanced options
    DB_HOST=/tmp/
    DB_USER=mastodon
    DB_NAME=mastodon_production
    DB_PASS=
    DB_PORT=${toString config.services.postgresql.port}
    
    # Federation
    # Note: Changing LOCAL_DOMAIN at a later time will cause unwanted side effects, including breaking all existing federation.
    # LOCAL_DOMAIN should *NOT* contain the protocol part of the domain e.g https://example.com.
    LOCAL_DOMAIN=social.erictapen.name

    # Application secrets
    # Generate each with the `RAILS_ENV=production bundle exec rake secret` task (`docker-compose run --rm web rake secret` if you use docker compose)
    PAPERCLIP_SECRET=845ff7788acc4aed84e6168e85c9ff1dfaca57bcd03c2bcc48aed5bca32e9801e3b9135f7cf0bce7c629736e11736e7047a096ac816cf33301bfcfc2172d184d
    SECRET_KEY_BASE=af59aaa0eba14276e1adcddd8ac4ba3c21f2b32dd88a6d53c0b1418660ccd9ddb35dd55b9b8dfffa233a7a57a3425772ac2444388823dc517f001d5a36f962dc
    OTP_SECRET=9bd457f20304882f5bcfc16c4f1c94dd70edf6005962c811caa562ffc203aebcbb1ba8e3a9478f7b6e79637896f4b3b0ae36f17d8220226513e1ff32475af7f1
    
    # VAPID keys (used for push notifications
    # You can generate the keys using the following command (first is the private key, second is the public one)
    # You should only generate this once per instance. If you later decide to change it, all push subscription will
    # be invalidated, requiring the users to access the website again to resubscribe.
    #
    # Generate with `RAILS_ENV=production bundle exec rake mastodon:webpush:generate_vapid_key` task (`docker-compose run --rm web rake mastodon:webpush:generate_vapid_key` if you use docker compose)
    #
    # For more information visit https://rossta.net/blog/using-the-web-push-api-with-vapid.html
    VAPID_PRIVATE_KEY=8bcJvG48LHSnHTGu8-QlTmXOg9Zn6Sd9H6gbkik_FDc=
    VAPID_PUBLIC_KEY=BEW0kLLvdobZzcb8ZPXwNu_O4EcS-uG9hQ7nGeBg0boBywfkVgr01-lM2oT8W3Q1W8_xV9Z-23rcpj-u5Hhlhr8=
    
    # Optionally change default language
    DEFAULT_LOCALE=de
  '';

in

{

  ###### interface

  options = {

    services.mastodon = {

      enable = mkOption {
        default = false;
        description = ''
          Whether to run the Mastodon Server.
        '';
      };

      portNumber = mkOption {
        default = 80;
        description = ''
          The port number the Mastodon server will be listening to.
        '';
      };

      dataDir = mkOption {
        default = "/var/lib/mastodon";
        description = ''
          The directory holding state.
        '';
      };

      user = mkOption {
        default = "mastodon";
        description = ''
        '';
      };

    };

  };


  ###### implementation

  config = mkIf cfg.enable {

    users.extraUsers = mkIf (cfg.user == "mastodon") [
      { name = "mastodon";
        # description = "Mastodon server";
        group = "mastodon";
      }];

    users.extraGroups = mkIf (cfg.user == "mastodon") [
      { name = "mastodon";
      }];

    services = {
      postgresql.enable = true;
      redis.enable = true;
    };

    systemd.services = {
      "mastodon-init-1" = {
        description = "Mastodon init Stage 1";
        wantedBy = [ "multi-user.target" ];

        script = ''
          if [[ ! -f ${cfg.dataDir} ]]; then
            mkdir -p ${cfg.dataDir}/live
            cp -r ${pkgs.mastodon}/. ${cfg.dataDir}/live
            cp ${env-production} ${cfg.dataDir}/live/.env.production
            chown -R ${cfg.user}:${cfg.user} ${cfg.dataDir}
            chmod -R u+rw ${cfg.dataDir}
            chmod -R g+rw ${cfg.dataDir}
            chmod -R a+rw ${cfg.dataDir}
          fi
        '';

        serviceConfig = {
          Type = "oneshot";
        };
      };

      "mastodon-init-2" = {
        description = "Mastodon init Stage 2";
        wantedBy = [ "multi-user.target" ];
        after = [ "postgresql.service" "mastodon-init-1.service" ];

        environment = {
          RAILS_ENV = "production";
        };

        path = [ pkgs.mastodon.rubyEnv pkgs.mastodon pkgs.ruby ];

        script = ''
          if [[ ! -f ${cfg.dataDir} ]]; then
            ${pkgs.mastodon.rubyEnv}/bin/rails db:setup
            ${pkgs.mastodon.rubyEnv}/bin/rails assets:precompile
          fi

        '';

        serviceConfig = {
          Type = "oneshot";
          User = cfg.user;
          WorkingDirectory = "${cfg.dataDir}/live";
        };
      };

      "mastodon-web" = {
        description = "Mastodon Web";
        after = [ "network.target" "mastodon-init-2.service" ];
        wantedBy = [ "multi-user.target" ];

        environment = {
          RAILS_ENV = "production";
          PORT = "3000";
        };

        serviceConfig = {
          Type = "simple";
          User = cfg.user;
          WorkingDirectory = "${cfg.dataDir}/live";
          ExecStart = "${pkgs.mastodon.rubyEnv}/bin/puma -C config/puma.rb";
          ExecReload = "${pkgs.coreutils}/bin/kill -SIGUSR1 $MAINPID";
          TimeoutSec = "15";
          Restart = "always";
        };
      };

      "mastodon-sidekiq" = {
        description = "Mastodon Sidekiq";
        after = [ "network.target" "mastodon-init-2.service" ];
        wantedBy = [ "multi-user.target" ];

        environment = {
          RAILS_ENV = "production";
          DB_POOL = "5";
        };

        serviceConfig = {
          Type = "simple";
          User = cfg.user;
          WorkingDirectory = "${cfg.dataDir}/live";
          ExecStart = "${pkgs.mastodon.rubyEnv}/bin/sidekiq -c 5 -q default -q mailers -q pull -q push";
          TimeoutSec = "15";
          Restart = "always";
        };
      };

      "mastodon-streaming" = {
        description = "Mastodon Streaming";
        after = [ "network.target" "mastodon-init-2.service" ];
        wantedBy = [ "multi-user.target" ];

        environment = {
          NODE_ENV = "production";
          PORT = "4000";
        };

        serviceConfig = {
          Type = "simple";
          User = cfg.user;
          WorkingDirectory = "${cfg.dataDir}/live";
          ExecStart = "${pkgs.mastodon.rubyEnv}/bin/npm run start";
          TimeoutSec = "15";
          Restart = "always";
        };
      };

    };

  };

}
