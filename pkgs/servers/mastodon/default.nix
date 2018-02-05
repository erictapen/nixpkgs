{ stdenv
, imagemagick
, ffmpeg
, protobuf
, protobufc
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
, rake
, bundlerEnv
, which
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
      cld3 = attrs: { buildInputs = [ protobuf protobufc pkgconfig ]; };
    };

    nativeBuildInputs = [
      protobufc
    ];

    buildInputs = [
      imagemagick
      ffmpeg
      protobufc
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
      ruby_2_4
      bundler
      rake
      yarn
    ];

    gemdir = ./.;
  };
in
stdenv.mkDerivation {
  name = "mastodon";

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
    rake
    yarn

    rubyEnv
  ];
}
