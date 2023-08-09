{ lib, applyPatches, yarn, mkYarnPackage, imagemagick, mobilizon-src }:

mkYarnPackage rec {
  src = applyPatches {
    name = "mobilizon-js-src";
    src = "${mobilizon-src}/js";
  };

  packageJSON = ./package.json;
  yarnLock = "${src}/yarn.lock";
  yarnNix = ./yarn.nix;

  buildPhase = ''
    runHook preBuild

    yarn run build

    runHook postBuild
  '';

  doCheck = true;
  checkPhase = "yarn run test";

  nativeBuildInputs = [ imagemagick ];

  meta = with lib; {
    description = "Frontend for the Mobilizon server";
    homepage = "https://joinmobilizon.org/";
    license = licenses.agpl3Plus;
    maintainers = with maintainers; [ minijackson erictapen ];
  };
}
