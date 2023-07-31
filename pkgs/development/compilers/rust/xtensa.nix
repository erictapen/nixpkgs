{ lib
, pkgsBuildTarget
, pkgsBuildBuild
, pkgsBuildHost
, fetchFromGitHub
, fetchpatch
, formats
, rust
, rustPlatform
, llvmPackages_xtensa
, python3
}: {

  packages.stable = rec {
    rustc = (rust.override {
      llvm_16 = llvmPackages_xtensa.libllvm;
      pkgsBuildTarget = pkgsBuildTarget // { llvmPackages_16 = pkgsBuildTarget.llvmPackages_xtensa; };
      pkgsBuildBuild = pkgsBuildBuild // { llvmPackages_16 = pkgsBuildBuild.llvmPackages_xtensa; };
      pkgsBuildHost = pkgsBuildHost // { llvmPackages_16 = pkgsBuildHost.llvmPackages_xtensa; };
    }).packages.stable.rustc.overrideAttrs (old: rec {
      pname = "rustc-xtensa";
      version = "1.70.0.1";
      src = fetchFromGitHub {
        owner = "esp-rs";
        repo = "rust";
        # latest esp-1.70.0.1 branch
        rev = "ed3726ba7aea45731260ec8f75f05fc60c2b0f22";
        sha256 = "sha256-aUGbMEhYBWFXS/FVzesIhhwuRBgHTRpYt3LE4mg3aBo=";
        fetchSubmodules = true;
      };
      patches = [
        (fetchpatch {
          url = "https://github.com/rust-lang/rust/pull/113733/commits/8fcca0425dccae8a1d7e656729016e4aef7e84cb.patch";
          sha256 = "sha256-4s0xN7Fbb2YxnaDxKNBpVzQjh3b4rhG6R35vKRMN4lE=";
        })
      ];
      configureFlags = old.configureFlags
        ++ [
          "--experimental-targets=Xtensa"
          # "--release-channel=nightly"
          "--enable-extended"
          "--tools=clippy,cargo,rustfmt"
          # "--enable-lld"
        ];

      prePatch = ''
        cp -r ../.cargo .cargo
        ln -s $cargoDepsCopy vendor
      '';
      # TODO replace this with something custom? Apparently rustc isn't really made for using fetchCargoTarball
      cargoDeps = rust.packages.stable.rustPlatform.fetchCargoTarball {
        inherit pname;
        inherit src;
        sourceRoot = null;
        srcs = null;
        patches = [ ];
        extraCargoVendorArgs = "--sync ./src/tools/rust-analyzer/Cargo.toml --sync ./compiler/rustc_codegen_cranelift/Cargo.toml --sync ./src/bootstrap/Cargo.toml";
        sha256 = "sha256-oBFrgOB6PLvvCEWHbLZKSLMz3TQ58u/3jzKklUr6g3Q=";
        nativeBuildInputs = [ python3 ];
      };
      nativeBuildInputs = old.nativeBuildInputs ++ [ rustPlatform.cargoSetupHook ];
      # postConfigure = ''
      #   ${old.postConfigure}
      #   unpackFile "$cargoDeps"
      #   mv $(stripHash $cargoDeps) vendor
      # '';
      meta.maintainers = with lib.maintainers; [ erictapen ];
    });

    cargo = (rust.packages.stable.cargo.override {
      inherit rustc;
    }).overrideAttrs (old: rec {
      pname = "cargo-xtensa";
      inherit (rustc) cargoDeps;
      postConfigure = ''
        ${old.postConfigure or ""}
        unpackFile "$cargoDeps"
        mv $(stripHash $cargoDeps) vendor
      '';
    });

  };
}
