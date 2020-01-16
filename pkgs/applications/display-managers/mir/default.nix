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
, wlcs
, libsystemtap
}:
stdenv.mkDerivation {
  name = "mir";

  src = fetchFromGitHub {
    owner = "MirServer";
    repo = "mir";
    rev = "v1.7.0";
    sha256 = "sha256:1lp6lpqy6ncjjksia3rbyk66qnpw9gd0di40ajkwckjdjn2357qh";
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
      wlcs
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
      libsystemtap
    ];
}

