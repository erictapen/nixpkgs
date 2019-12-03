{ lib
, stdenv
, fetchFromGitHub
, pkgconfig
, meson
, ninja
, libX11
, mesa
, libGL
, wayland
, x11
, buildPackages
}:

let
  eglexternalplatform = stdenv.mkDerivation {
    pname = "eglexternalplatform";
    version = "1.1";

    src = fetchFromGitHub {
      owner = "Nvidia";
      repo = "eglexternalplatform";
      rev = "7c8f8e2218e46b1a4aa9538520919747f1184d86";
      sha256 = "0lr5s2xa1zn220ghmbsiwgmx77l156wk54c7hybia0xpr9yr2nhb";
    };

    installPhase = ''
      mkdir -p "$out/include/"
      cp interface/eglexternalplatform.h "$out/include/"
      cp interface/eglexternalplatformversion.h "$out/include/"

      substituteInPlace eglexternalplatform.pc \
        --replace "/usr/include/EGL" "$out/include"
      mkdir -p "$out/share/pkgconfig"
      cp eglexternalplatform.pc "$out/share/pkgconfig/"
    '';

    meta = with lib; {
      license = licenses.mit;
    };
  };

in stdenv.mkDerivation rec {
  pname = "egl-wayland";
  version = "1.1.4";

  outputs = [ "out" "dev" ];

  src = fetchFromGitHub {
    owner = "Nvidia";
    repo = pname;
    rev = version;
    sha256 = "0wvamjcfycd7rgk7v14g2rin55xin9rfkxmivyay3cm08vnl7y1d";
  };

  # Add missing include
  # https://github.com/NVIDIA/egl-wayland/pull/24
  patches = [ ./eglmesaext.patch ];

  nativeBuildInputs = [
    meson
    ninja
    pkgconfig
  ];

  buildInputs = [
    eglexternalplatform
    libX11
    mesa
    libGL
    wayland
  ];

  # configureFlags = [ "WAYLAND_SCANNER=${buildPackages.wayland}/bins/wayland-scanner" ];
  # mesonFlags = [
  #   "-Dprog_scanner=${buildPackages.wayland}/bin/wayland-scanner"
  #   "-Dwl_scanner=${buildPackages.wayland}/bin/wayland-scanner"
  #   "-Dwayland-scanner=${buildPackages.wayland}/bin/wayland-scanner"
  # ];

  # postInstall = let
  #   nw-json = builtins.toFile "10_nvidia_wayland.json" ''
  #     {
  #         "file_format_version" : "1.0.0",
  #         "ICD" : {
  #             "library_path" : "libnvidia-egl-wayland.so.1"
  #         }
  #     }
  #   '';
  # in  ''
  #   mkdir -p $out/share/egl/egl_external_platform.d
  #   ln -s ${nw-json} $out/share/egl/egl_external_platform.d/10_nvidia_wayland.json
  # '';

  meta = with lib; {
    description = "The EGLStream-based Wayland external platform";
    homepage = "https://github.com/NVIDIA/egl-wayland/";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = with maintainers; [ hedning ];
  };
}
