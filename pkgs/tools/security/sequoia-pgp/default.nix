{ stdenv, fetchFromGitLab, fetchurl, runCommand, rustPlatform
, pkgconfig
, gcc
, openssl
, capnproto
, nettle
, clang
, llvmPackages
, sqlite
}:

rustPlatform.buildRustPackage rec {
  name = "sequoia-pgp-${version}";
  version = "v0.5.0";

  src =
    let
      source = fetchFromGitLab {
        owner = "sequoia-pgp";
        repo = "sequoia";
        rev = version;
        sha256 = "0r8cs888ry621wa8rdcipmhwzd9jya6a9n6m0cwjzhh8w78sg5n9";
      };
      cargo-lock = fetchurl {
        url = "https://gist.githubusercontent.com/erictapen/d5486b923efdbe933d633b0826749914/raw/08fac3c1b0ab2b0edc3ae2090c5d1cc240c38bcc/Cargo.lock";
        sha256 = "0l9y3ck6ppmzm9i41dbyvmrchgymgy0j611hxplh5p1zds2fi8ws";
      };
    in
    runCommand "cargo-sequoia-src" {} ''
      cp -R ${source} $out
      chmod +w $out
      cp ${cargo-lock} $out/Cargo.lock
    '';

  # patches = [ ./tests.patch ];

  buildPhase = ''
    cargo build --frozen --release --manifest-path buffered-reader/Cargo.toml
    cargo build --frozen --release --manifest-path core/Cargo.toml
    cargo build --frozen --release --manifest-path ffi/Cargo.toml
    cargo build --frozen --release --manifest-path ffi-macros/Cargo.toml
    cargo build --frozen --release --manifest-path guide/Cargo.toml
    cargo build --frozen --release --manifest-path net/Cargo.toml
    cargo build --frozen --release --manifest-path openpgp/Cargo.toml
    cargo build --frozen --release --manifest-path openpgp-ffi/Cargo.toml
    cargo build --frozen --release --manifest-path sqv/Cargo.toml
    cargo build --frozen --release --manifest-path store/Cargo.toml
    cargo build --frozen --release --manifest-path tool/Cargo.toml
    cargo build --frozen --release
  '';

  checkPhase = ''
    cargo test --manifest-path buffered-reader/Cargo.toml
    cargo test --manifest-path core/Cargo.toml
    cargo test --manifest-path ffi/Cargo.toml
    cargo test --manifest-path ffi-macros/Cargo.toml
    cargo test --manifest-path guide/Cargo.toml
    # cargo test --manifest-path net/Cargo.toml
    cargo test --manifest-path openpgp/Cargo.toml
    cargo test --manifest-path openpgp-ffi/Cargo.toml
    cargo test --manifest-path sqv/Cargo.toml
    cargo test --manifest-path store/Cargo.toml
    # cargo test --manifest-path tool/Cargo.toml
    cargo test 
  '';

  buildInputs = [
    pkgconfig
    gcc
    openssl
    capnproto
    nettle
    clang
    llvmPackages.libclang
    sqlite
  ];

  LIBCLANG_PATH = "${llvmPackages.libclang}/lib";

  cargoSha256 = "0p7dx9g62hqkmly70hl2a4xx76zwqn1v5f48dr4rw3kf6gpxkwk3";

  meta = with stdenv.lib; {
    description = "openPGP implementation in Rust";
    homepage = https://gitlab.com/sequoia-pgp/sequoia;
    license = with licenses; [ gpl3 ];
    maintainers = [ maintainers.erictapen ];
    platforms = platforms.linux;
  };
}
