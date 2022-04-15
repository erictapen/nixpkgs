{ lib, llvmPackages_14, fetchFromGitHub }:
let
  version = "esp-14.0.0-20220415";
in
lib.mapAttrs
  (_: drv: drv.overrideAttrs (old: {
    inherit version;
    meta.maintainers = [ lib.maintainers.erictapen ];
  }))
  (llvmPackages_14.override {
    llvmSources = fetchFromGitHub {
      owner = "espressif";
      repo = "llvm-project";
      rev = version;
      sha256 = "sha256-goXiXDyY2D0WtdwMPV/5Y37MtGUN+yIOGMuS+0TFic8=";
    };
  })
