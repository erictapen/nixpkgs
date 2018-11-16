{ stdenv
, imagemagick
, ffmpeg
, protobuf
, postgresql
, nodejs
, yarn
, libpqxx
, libxml2
, libxslt
, file
, git
, pkgconfig
, autoconf
, bison
, readline62
, zlib
, ncurses5
, libffi
, gdbm
, libidn
, icu
, ruby_2_4
, bundler
, bundlerEnv
, which
, fetchFromGitHub
, fetchurl
, fetchgit
, runCommand
, writeTextFile
, libtool
, utillinux
, python2
, nodejs-6_x
, buildEnv
}:


let
  rubyEnv = bundlerEnv {
    name = "mastodon-env";
    inherit ruby_2_4;

    gemConfig = {
      "idn-ruby" = attrs: { buildInputs = [ libidn ]; };
      "charlock_holmes" = attrs: { buildInputs = [ which icu zlib ]; };
      nokogiri = attrs: { buildInputs = [ zlib ]; };
      pg = attrs: { buildInputs = [ postgresql ]; };
      cld3 = attrs: { buildInputs = [ protobuf pkgconfig ]; };
      ffi = attrs: { buildInputs = [ libffi pkgconfig ]; };
    };
    buildInputs = [ bundler ];

    gemdir = ./.;

    ignoreCollisions = true;
  };
  # node-packages*.nix generated via:
  #
  # % node2nix --input package.json \
  #            --output node-packages-generated.nix \
  #            --composition node-packages.nix \
  #            --node-env ./../../development/node-packages/node-env.nix \
  #            --pkg-name nodejs-6_x
  nodeEnv = import ./node-packages-generated.nix {
    inherit fetchurl fetchgit;
    nodeEnv = import ../../development/node-packages/node-env.nix {
      inherit stdenv python2 utillinux runCommand writeTextFile libtool;
      nodejs = nodejs-6_x;
    };
  };
in
stdenv.mkDerivation rec{
  name = "mastodon";
  version = "2.1.2";

  src = fetchFromGitHub {
    owner = "tootsuite";
    repo = "mastodon";
    rev = "v${version}";
    sha256 = "0kfkcn29yk7x21101xcv0qppxxsn4k7m1p36c7jxmhmv407lhnbx";
  };

  env = buildEnv {
    name = "mastodon-env";
    paths = [
      imagemagick
      ffmpeg
      protobuf
      postgresql
      nodejs
      yarn
      libpqxx
      libxml2
      libxslt
      file
      git
      pkgconfig
      autoconf
      bison
      readline62
      zlib
      ncurses5
      libffi
      gdbm
      libidn
      icu
      # ruby_2_4
      # bundler
      yarn

      rubyEnv
      nodeEnv.shell
    ];
  };

  passthru = {
    inherit rubyEnv;
  };

  installPhase = ''
    mkdir -p $out
    # rm -r bin
    cp -R . $out/
  '';

}
