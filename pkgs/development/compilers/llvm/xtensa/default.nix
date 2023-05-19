{ lib, llvmPackages_15, fetchFromGitHub }:
let
  version = "esp-15.0.0-20230404";
in
lib.mapAttrs
  (_: drv: drv.overrideAttrs (old: {
    inherit version;
    meta.maintainers = [ lib.maintainers.erictapen ];
  }))
  (llvmPackages_15.override {
    gitRelease = {
      version = "15.0.0";
      rev = "1e28f73ab9cb70f289f3eb25bb7875ba8694da0c";
      rev-version = version;
    };
    officialRelease = null;
    monorepoSrc = fetchFromGitHub {
      owner = "espressif";
      repo = "llvm-project";
      rev = version;
      sha256 = "sha256-IDrVrQI8ea8JHL5Y24UdJwt1RuXz0gaeRMkdVfQk+RU=";
    };
  })
