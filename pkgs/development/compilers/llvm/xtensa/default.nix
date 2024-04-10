{ lib, llvmPackages_17, fetchFromGitHub }:
let
  version = "esp-17.0.1_20240408";
in
lib.mapAttrs
  (_: drv: drv.overrideAttrs (old: {
    inherit version;
    meta.maintainers = [ lib.maintainers.erictapen ];
  }))
  (llvmPackages_17.override {
    gitRelease = {
      # For some reason this is actually 17.0.1 ...
      version = "17.0.1";
      rev = "b02b417b69c75c34a17031c5c3c8800f7c99605b";
      rev-version = version;
    };
    officialRelease = null;
    monorepoSrc = fetchFromGitHub {
      owner = "espressif";
      repo = "llvm-project";
      rev = version;
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
    };
  })
