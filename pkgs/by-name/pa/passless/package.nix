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
    # tpm2-tss
  ];

  postInstall = ''
    install -Dm644 contrib/udev/* $out/etc/udev/rules.d

    # target/x86_64-unknown-linux-gnu/release/build/passless-rs-46cc273685f7f560/out/completions
    export COMPLETIONS="target/${stdenv.targetPlatform.config}/$cargoBuildType/build/passless-rs-*/out/completions"

    echo $COMPLETIONS
    ls -la $COMPLETIONS

    installShellCompletion --cmd passless \
      --bash $COMPLETIONS/passless.bash \
      --fish $COMPLETIONS/passless.fish \
      --zsh $COMPLETIONS/_passless
  '';

  meta.mainProgram = "passless";

})
