{ lib
, fetchFromGitHub
, rust
, llvmPackages_xtensa
, python3
}: {

  packages.stable = rec {
    rustc = (rust.override {
      llvm_15 = llvmPackages_xtensa.libllvm;
    }).packages.stable.rustc.overrideAttrs (old: rec {
      pname = "rustc-xtensa";
      version = "1.56.1";
      src = fetchFromGitHub {
        owner = "esp-rs";
        repo = "rust";
        # latest esp-1.56.1
        rev = "6ed7fe3880ed97b406ea80021f3c7aad4a35abff";
        sha256 = "sha256-PPXqNI/6tsQMDIxsul0q5BoRbDBPYFY7l/35ZhTwiuU=";
        fetchSubmodules = true;
      };
      configureFlags = old.configureFlags
        ++ [ "--set=build.rustfmt=${rust.packages.stable.rustfmt}/bin/rustfmt" ];
      cargoDeps = rust.packages.stable.rustPlatform.fetchCargoTarball {
        inherit pname;
        inherit src;
        sourceRoot = null;
        srcs = null;
        patches = [ ];
        sha256 = "sha256-3cGjS6AX3ci3VKi3jzGHF7UDaTbNJ8N7+h/8iEuvNCw=";
        nativeBuildInputs = [ python3 ];
      };
      postConfigure = ''
        ${old.postConfigure}
        unpackFile "$cargoDeps"
        mv $(stripHash $cargoDeps) vendor
      '';
      meta.maintainers = [ lib.maintainers.erictapen ];
    });

    cargo = (rust.packages.stable.cargo.override {
      inherit rustc;
    }).overrideAttrs (old: rec {
      pname = "cargo-xtensa";
      version = "1.56.1";
      inherit (rustc) cargoDeps;
      postConfigure = ''
        ${old.postConfigure or ""}
        unpackFile "$cargoDeps"
        mv $(stripHash $cargoDeps) vendor
      '';
    });

  };
}
