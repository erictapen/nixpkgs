{ stdenv
, lib
, formats
, nixosTests
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
  version = "1.1.0-alpha.7";

  src = fetchFromGitHub {
    owner = pname;
    repo = pname;
    rev = "v${version}";
    sha256 = "C+ITINRQLJjC8sL2PKvnnHHdLQ3y5OWz0wNMDfmn2vw=";
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

  cargoHash = "sha256-Cm3gNm3amUsJxDPsXDsGr+lFnN+H6XzIp4UmiUIdofM=";

  preFixup = ''
    installShellCompletion --bash $releaseDir/build/completions/*.bash
    installShellCompletion --zsh  $releaseDir/build/completions/_*
  '';

  passthru.tests = { inherit (nixosTests) kanidm; };

  meta = with lib; {
    description = "A simple, secure and fast identity management platform";
    homepage = "https://github.com/kanidm/kanidm";
    license = licenses.mpl20;
    platforms = platforms.linux;
    maintainers = with maintainers; [ erictapen Flakebi ];
  };
}
