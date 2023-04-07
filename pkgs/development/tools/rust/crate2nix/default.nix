{ lib
, rustPlatform
, fetchFromGitHub
, makeWrapper

, cargo
, nix
, nix-prefetch-git
}:

rustPlatform.buildRustPackage rec {
  pname = "crate2nix";
  version = "0.11.0-master";

  src = fetchFromGitHub {
    owner = "kolloch";
    repo = pname;
    rev = "a463923ade197f616876e4068efe15230b92f96f";
    sha256 = "sha256-8NcBU6oIKhVvP9DdDu4f5FHN4CanQjvSSfWv683eMFs=";
  };

  sourceRoot = "source/crate2nix";

  cargoSha256 = "sha256-PtDYrsR3h8izGLFPBz6Ee22dddPG2A4mUX3R3tNrXVU=";

  nativeBuildInputs = [ makeWrapper ];

  # Tests use nix(1), which tries (and fails) to set up /nix/var inside the
  # sandbox
  doCheck = false;

  postFixup = ''
    wrapProgram $out/bin/crate2nix \
        --suffix PATH ":" ${lib.makeBinPath [ cargo nix nix-prefetch-git ]}
  '';

  meta = with lib; {
    description = "A Nix build file generator for Rust crates.";
    longDescription = ''
      Crate2nix generates Nix files from Cargo.toml/lock files
      so that you can build every crate individually in a Nix sandbox.
    '';
    homepage = "https://github.com/kolloch/crate2nix";
    license = licenses.asl20;
    maintainers = with maintainers; [ kolloch cole-h ];
    platforms = platforms.all;
  };
}
