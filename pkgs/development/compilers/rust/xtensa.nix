{ lib
, fetchFromGitHub
, rust
, rustPlatform
, llvmPackages_xtensa
, python3
}: {

  packages.stable = rec {
    rustc = (rust.override {
      llvm_15 = llvmPackages_xtensa.libllvm.override {
        doCheck = false;
      };
    }).packages.stable.rustc.overrideAttrs (old: rec {
      pname = "rustc-xtensa";
      version = "1.69.0.1";
      src = fetchFromGitHub {
        owner = "esp-rs";
        repo = "rust";
        # latest esp-1.69.0.1 branch
        rev = "4896f6b455b005c410fb7ef87a2f96bf5b1b73cb";
        sha256 = "sha256-RIZ4ZEHQxLXkY+BJc+f4RYKiwgDeUL84cIiZ9VE3mj0=";
        fetchSubmodules = true;
      };
      # configureFlags = old.configureFlags
      #   ++ [ "--set=build.rustfmt=${rust.packages.stable.rustfmt}/bin/rustfmt" ];
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
        sha256 = "sha256-jPqlL3Z5XwZd5iEuettGvkNreXR2bQ0/EiAxtTr6riA=";
        nativeBuildInputs = [ python3 ];
      };
      nativeBuildInputs = old.nativeBuildInputs ++ [ rustPlatform.cargoSetupHook ];
      # postConfigure = ''
      #   ${old.postConfigure}
      #   unpackFile "$cargoDeps"
      #   mv $(stripHash $cargoDeps) vendor
      # '';
      meta.maintainers = [ lib.maintainers.erictapen ];
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
