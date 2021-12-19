{ lib, llvmPackages_13, fetchFromGitHub }:
let
  version = "esp-13.0.0-20211203";
in
lib.mapAttrs
  (_: drv: drv.overrideAttrs (old: {
    inherit version;
    meta.maintainers = [ lib.maintainers.erictapen ];
  }))
  (llvmPackages_13.override {
    llvmSources = fetchFromGitHub {
      owner = "espressif";
      repo = "llvm-project";
      rev = version;
      sha256 = "sha256-9UZa7HLrwc9eEz0FXOaqbgYWMB7BeWuuEUVtoLUFx3o=";
    };
  })
