{ stdenv, lib, fetchFromGitHub }:

stdenv.mkDerivation rec{
  name = "eglexternalplatform";
  version = "2018-08-16";

  src = fetchFromGitHub {
    owner = "NVIDIA";
    repo = "eglexternalplatform";
    rev = "7c8f8e2218e46b1a4aa9538520919747f1184d86";
    sha256 = "0lr5s2xa1zn220ghmbsiwgmx77l156wk54c7hybia0xpr9yr2nhb";
  };

  installPhase = ''
    # mkdir -p $out/include/EGL
    # cp -r interface/* $out/include/EGL
    mkdir -p $out/include
    cp -r interface/* $out/include

    mkdir -p $out/share/pkgconfig
    cp *.pc $out/share/pkgconfig

    mkdir -p $out/share/licenses/${name}
    cp COPYING $out/share/licenses/${name}
  '';
}
