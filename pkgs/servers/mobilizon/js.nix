{ lib, applyPatches, yarn, mkYarnPackage, imagemagick, mobilizon-src }:

mkYarnPackage rec {
  src = applyPatches {
    name = "mobilizon-js-src";
    src = "${mobilizon-src}/js";
  };

  # Somehow $out/deps/mobilizon/node_modules ends up only containing a .bin
  # directory otherwise.
  yarnPostBuild = ''
    rm -rf $out/deps/mobilizon/node_modules
    ln -s $out/node_modules $out/deps/mobilizon/node_modules
  '';

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
