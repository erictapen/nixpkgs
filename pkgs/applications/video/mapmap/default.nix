{ stdenv, 
  fetchFromGitHub,
  qttools,
  qtmultimedia,
  liblo,
  gst_all_1,
  gst-plugins-bad,
  gst-plugins-base,
  gst-plugins-good,
  gst-plugins-ugly,
  qmake,
  pkgconfig
}:

with stdenv;

mkDerivation rec {

  version = "0.5.0";
  name = "mapmap-${version}";
  src = fetchFromGitHub {
    owner = "mapmapteam";
    repo = "mapmap";
    rev = version;
    sha256 = "1l5iv5h0m2cmzkas22ww8kw5f6db3s40yyql1ayciaxihc6lqcn5";
  };

  nativeBuildInputs = [
    qmake
    pkgconfig
  ];

  buildInputs = [
    qttools
    qtmultimedia
    liblo
    gst_all_1.gstreamer
    gst_all_1.gstreamermm
    gst_all_1.gst-libav
    gst_all_1.gst-vaapi
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-ugly
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp mapmap $out/bin/mapmap
  '';

  meta = with stdenv.lib; {
    description = "Open source video mapping software";
    homepage = https://github.com/mapmapteam/mapmap;
    license = licenses.gpl3;
    maintainers = [ maintainers.erictapen ];
    platforms = platforms.linux;
  };

}
