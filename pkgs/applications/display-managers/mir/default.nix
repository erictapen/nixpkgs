{ stdenv, lib, fetchFromGitHub
, cmake
, pkgconfig
, gtest
, valgrind
, boost
, wayland
, eglexternalplatform
, egl-wayland
, libGL
, glm
, protobuf
, capnproto
, glog
, gflags
, libudev
, glib
, xorg
, x11
, pcre
, mesa
, epoxy
, nettle
, libinput
, libuuid
, libxmlxx
, libyamlcpp
, libxkbcommon
, python3Packages
, libevdev
, umockdev
, liburcu
, lttng-ust
}:
stdenv.mkDerivation {
  name = "mir";

  src = fetchFromGitHub {
    owner = "MirServer";
    repo = "mir";
    rev = "v1.4.0";
    sha256 = "d/gdjx2KTjBYJ/08OvsUrDNCJk8p7IoR4rEWYUPX7UQ=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
      cmake
      pkgconfig
      # Mir does some string replacement in the path name in order to
      # canonicalize from 'gtest' (new) to 'gmock' (old) as the package name.
      # This also alters the nix store path, resulting in missing files.
      # Therefore the package name part in the nix store path must be
      # 'gmock'...
      (gtest.overrideAttrs (oldAttrs: { name = "gmock-${oldAttrs.version}"; }))
      valgrind
    ];

  buildInputs = [
      boost
      wayland
      eglexternalplatform
      egl-wayland
      libGL
      glm
      protobuf
      capnproto
      glog
      gflags
      libudev
      glib
      xorg.libxcb
      xorg.libXcursor
      x11
      xorg.libpthreadstubs
      xorg.libXdmcp
      xorg.libXfixes
      pcre
      mesa
      epoxy
      nettle
      libinput
      libuuid
      libxmlxx
      libyamlcpp
      libxkbcommon
      python3Packages.pillow
      libevdev
      umockdev
      liburcu
      lttng-ust
    ];
}

