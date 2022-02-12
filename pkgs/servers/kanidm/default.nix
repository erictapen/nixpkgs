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

  KANIDM_BUILD_PROFILE = "release_nixos_${arch}";

  postPatch =
    let
      format = (formats.toml { }).generate "${KANIDM_BUILD_PROFILE}.toml";
      profile = {
        web_ui_pkg_path = "@web_ui_pkg_path@";
        cpu_flags = if stdenv.isx86_64 then "x86_64_v1" else "none";
      };
    in
    ''
      cp ${format profile} profiles/${KANIDM_BUILD_PROFILE}.toml
      substituteInPlace profiles/${KANIDM_BUILD_PROFILE}.toml \
        --replace '@web_ui_pkg_path@' "$out/ui"
    '';

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

  # Failing tests, probably due to network issues
  checkFlags = [
    "--skip default_entries"
    "--skip oauth2_openid_basic_flow"
    "--skip test_server"
    "--skip test_cache"
  ];

  preFixup = ''
    installShellCompletion --bash $releaseDir/build/completions/*.bash
    installShellCompletion --zsh  $releaseDir/build/completions/_*

    # PAM and NSS need fix library names
    mv $out/lib/libnss_kanidm.so $out/lib/libnss_kanidm.so.2
    mv $out/lib/libpam_kanidm.so $out/lib/pam_kanidm.so

    cp -r kanidmd_web_ui/pkg $out/ui
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
