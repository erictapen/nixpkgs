{
  lib,
  fetchFromGitHub,
  php,
  phpCfg ? null,
  phpunit
}:

php.buildComposerProject (finalAttrs: {
  pname = "atom";
  version = "2.8.2";

  src = fetchFromGitHub {
    owner = "artefactual";
    repo = "atom";
    rev = "dev/php-80-update";
    hash = "sha256-HuMWI+UT/FA+Mr52jqvTU9OphaMpmxwUCsWNEyf+P+0=";
  };

  composerNoDev = true;

  php = php.buildEnv ({
    extensions = ({ all, enabled }:
      enabled
        ++ (with all; [
            curl ldap opcache readline mbstring xsl zip apcu imagick
          ])
    );
  } // lib.optionalAttrs (phpCfg != null) {
    extraConfig = phpCfg;
  });

  vendorHash = "sha256-v8FPCgLWljEFuk/ghyZhye96IGdmlIrYXwvmeu8XbGI=";

  # Run unit tests with `composer test`

})
