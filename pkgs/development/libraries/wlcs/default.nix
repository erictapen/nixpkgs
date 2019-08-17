{ stdenv, lib, fetchFromGitHub
, cmake
, pkgconfig
, gtest
, wayland
, boost
}:
stdenv.mkDerivation {
  name = "wlcs";

  src = fetchFromGitHub {
    owner = "MirServer";
    repo = "wlcs";
    rev = "v1.1.0";
    sha256 = "sha256-bDuH+eHF+EHWgLMix3mh5RiekgzGK0SPiGEIzh1sKi4=";
  };

  nativeBuildInputs = [
    cmake
    pkgconfig
    # wlcs does some string replacement in the path name in order to
    # canonicalize from 'gtest' (new) to 'gmock' (old) as the package name.
    # This also alters the nix store path, resulting in missing files.
    # Therefore the package name part in the nix store path must be
    # 'gmock'...
    (gtest.overrideAttrs (oldAttrs: { name = "gmock-${oldAttrs.version}"; }))
  ];

  buildInputs = [
    wayland
    boost
  ];
}

