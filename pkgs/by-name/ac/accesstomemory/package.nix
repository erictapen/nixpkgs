{
  lib,
  fetchFromGitHub,
  buildNpmPackage,
  fetchNpmDeps,
  lessc,
  php,
  phpCfg ? null,
  phpunit
}:

let
  version = "2.8.2";
  src = fetchFromGitHub {
    owner = "artefactual";
    repo = "atom";
    rev = "dev/php-80-update";
    hash = "sha256-HuMWI+UT/FA+Mr52jqvTU9OphaMpmxwUCsWNEyf+P+0=";
  };
  frontend = buildNpmPackage rec {
    pname = "accesstomemory-frontend";
    inherit version src;

    npmDepsHash = "sha256-w8526//Lm5RhlnKC7T4Wid2ymXViW1aqNSoI1N/0rb0=";

    env.CYPRESS_INSTALL_BINARY = "0"; # disallow cypress from downloading binaries in sandbox

    # Compiling these plugins fails currently
    # nativeBuildInputs = [ lessc ];
    # postBuild = ''
    #   make -C plugins/arDominionPlugin
    #   make -C plugins/arArchivesCanadaPlugin
    # '';

    installPhase = ''
      mkdir $out
      cp -r dist/* $out/
    '';
  };
in
php.buildComposerProject (finalAttrs: {
  pname = "accesstomemory";
  inherit version src;

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

  postInstall = ''
    ln -s ${frontend} $out/dist
  '';

  passthru = {
    inherit frontend;
  };

})
