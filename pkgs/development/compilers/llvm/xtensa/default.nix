{ lib, llvmPackages_16, fetchFromGitHub }:
let
  version = "esp-16.0.0-20230516";
in
lib.mapAttrs
  (_: drv: drv.overrideAttrs (old: {
    inherit version;
    meta.maintainers = [ lib.maintainers.erictapen ];
  }))
  (llvmPackages_16.override {
    gitRelease = {
      # For some reason this is actually 16.0.1 ...
      version = "16.0.1";
      rev = "fe4f10a809705c2ddbed62145616bb9c85c499c0";
      rev-version = version;
    };
    officialRelease = null;
    monorepoSrc = fetchFromGitHub {
      owner = "espressif";
      repo = "llvm-project";
      rev = version;
      sha256 = "sha256-ZdG32esER1/+UcTtuGE4KjEbwEuMAbpk5TVGpIvN8Qw=";
    };
  })
