{ runtimeShell, lib, writeShellScriptBin, bundix, bundler, bundler-audit, coreutils, git, nix }:

attrPath:

writeShellScriptBin "bundler-update-script" ''
  PATH=${lib.makeBinPath [ bundler bundler-audit bundix coreutils git nix ]}
  set -o errexit
  set -o nounset
  set -o pipefail

  toplevel=$(git rev-parse --show-toplevel)
  position=$(nix eval -f "$toplevel" --raw "${attrPath}.meta.position")
  gemdir=$(dirname "$position")

  cd "$gemdir"

  bundler lock --update
  bundler-audit check --update
  bundix
''
