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
  version = "0.11.0-rc.4";

  src = fetchFromGitHub {
    owner = "kolloch";
    repo = pname;
    rev = version;
    sha256 = "sha256-GRXZBi54jyn+6rRZos0IBqCBTddMPkkt8A2VXWgYCFo=";
  };

  sourceRoot = "source/crate2nix";

  cargoSha256 = "sha256-GKlRUN9VCMIM+E9+gkE48YeEUkSg+kZC5T0hq1EHrVY=";

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
