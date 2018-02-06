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
, pkgs
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
    };

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
  nodeEnv = import ./node-packages.nix {
    inherit pkgs;
    inherit (stdenv) system;
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

  buildInputs = [
    imagemagick
    ffmpeg
    protobuf
    # nginx
    # redis
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
    ruby_2_4
    bundler
    #rake
    yarn

    rubyEnv
    nodeEnv.shell
  ];

}
