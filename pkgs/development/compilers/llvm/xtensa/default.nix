{ lib, llvmPackages_15, fetchFromGitHub }:
let
  version = "esp-15.0.0-20220922";
in
lib.mapAttrs
  (_: drv: drv.overrideAttrs (old: {
    inherit version;
    meta.maintainers = [ lib.maintainers.erictapen ];
  }))
  (llvmPackages_15.override {
    llvmSources = fetchFromGitHub {
      owner = "espressif";
      repo = "llvm-project";
      rev = version;
      sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
    };
  })
