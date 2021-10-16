{ stdenv
, lib
, formats
, rustPlatform
, fetchFromGitHub
, runCommand
, installShellFiles
, pkg-config
, udev
, openssl
, sqlite
, pam }:

let
  arch = if stdenv.isx86_64 then "x86_64" else "generic";
in
rustPlatform.buildRustPackage rec {
  pname = "kanidm";
  # Latest version doesn't have OIDC support. This can be changed to a stable
  # release as soon as a new version comes out.
  version = "unstable-2021-11-21";

  src = fetchFromGitHub {
    owner = pname;
    repo = pname;
    # master from 2021-11-21
    rev = "0f4189a57ef9fb0f048cd2cc3f5eee3d132adbd1";
    sha256 = "sha256-+FOcRWy8YOPAl5VgUKM1x5ZQkArYP+0rwrCQxXJ4Ms0=";
  };

  postPatch =
    let
      format = (formats.toml { }).generate "release_nixos_${arch}.toml";
      profile = {
        # We currently don't build the wasm artifacts, but use the
        # precompiled one included in the source.
        web_ui_pkg_path = runCommand "kanidmd_web_ui" { } ''
          mkdir -p $out
          cp -r ${src}/kanidmd_web_ui/* $out
        '';
        cpu_flags = if stdenv.isx86_64 then "x86_64_v1" else "none";
      };
    in
    ''
      ln -s ${format profile} ./profiles/release_nixos_${arch}.toml
    '';
  KANIDM_BUILD_PROFILE = "release_nixos_${arch}";

  nativeBuildInputs = [
    pkg-config
    installShellFiles
  ];

  buildInputs = [
    udev
    openssl
    sqlite
    pam
  ];

  cargoHash = "sha256:0diqj41wmv0gki0lmq5c24wn2yfkkp1giabn2mcxap1sfra2mi4a";

  preFixup = ''
    installShellCompletion --bash $releaseDir/build/completions/*.bash
    installShellCompletion --zsh  $releaseDir/build/completions/_*
  '';

  meta = with lib; {
    description = "A simple, secure and fast identity management platform";
    homepage = "https://github.com/kanidm/kanidm";
    license = licenses.mpl20;
    platforms = platforms.linux;
    maintainers = [ maintainers.erictapen ];
  };

}
