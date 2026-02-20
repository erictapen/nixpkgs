{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  installShellFiles,
  udev,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "passless";
  version = "0.10.1";

  src = fetchFromGitHub {
    owner = "pando85";
    repo = "passless";
    tag = "v${finalAttrs.version}";
    hash = "sha256-qUTaDWsnHFW3QyfzN58Gp3Z3y2jL1jyCfRTOPG+louE=";
  };

  cargoHash = "sha256-M+LmCTBHd7XDswJqF34nd1DZBxgUHiyWSySZw66bMpc=";

  nativeBuildInputs = [
    pkg-config
    installShellFiles
  ];

  buildInputs = [
    udev
  ];

  env.completions = "target/${stdenv.targetPlatform.config}/release/completions";

  postInstall = ''
    # installShellCompletion --cmd passless \
    #   --bash $completions/${finalAttrs.pname}.bash \
    #   --fish $completions/${finalAttrs.pname}.fish \
    #   --zsh $completions/_${finalAttrs.pname}
  '';

})
