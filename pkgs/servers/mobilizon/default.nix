{ lib
, beam
, callPackage
, writeShellScriptBin
, writeText
, yarn2nix
, mix2nix
, fetchFromGitLab
, fetchFromGitHub
, fetchgit
, fetchurl
, git
, cmake
, nixosTests
, srcOverride ? null
}:

let
  beamPackages = beam.packages.erlangR25.extend (self: super: {
    elixir = super.elixir_1_14;
  });
  inherit (beamPackages) mixRelease buildMix buildRebar3 fetchHex;
in
mixRelease rec {
  pname = "mobilizon";
  version = "3.0.4";

  src = if srcOverride != null then srcOverride else fetchFromGitLab {
    domain = "framagit.org";
    owner = "framasoft";
    repo = pname;
    rev = version;
    sha256 = "sha256-U7+xwWKyPdJVcpGbBOAuWUTKLsLesBKzPfy8gqySxh0=";
  };

  patches = [
    # ./cache_feed.patch
    ./timex.patch
    ./expo.patch
    ./deps.patch
  ];

  compileFlags = [ "--no-validate-compile-env" ];

  nativeBuildInputs = [ git cmake ];

  mixNixDeps = import ./mix.nix {
    inherit beamPackages lib;
    overrides = (final: prev: {
      mime = prev.mime.override {
        patchPhase = let
          cfgFile = writeText "config.exs" ''
            import Config
            config :mime, :types, %{
              "application/activity+json" => ["activity-json"],
              "application/ld+json" => ["activity-json"],
              "application/jrd+json" => ["jrd-json"],
              "application/xrd+xml" => ["xrd-xml"]
            }
          '';
        in ''
          mkdir config
          cp ${cfgFile} config/config.exs
        '';
      };
      # https://github.com/elixir-gettext/expo/pull/109
      expo = prev.expo.override {
        src = fetchFromGitHub {
          owner = "elixir-gettext";
          repo = "expo";
          rev = "f70ed88a225f2b7f6c81235c7dd4f38f74d248a5";
          sha256 = "sha256-3BBEg71LMOrWoxEvMGepjWf+iHMrMSzLLJ+PfD36Y0Y=";
        };
      };
      fast_html = prev.fast_html.override {
        nativeBuildInputs = [ cmake ];
      };
      ex_cldr = prev.ex_cldr.overrideAttrs (old: {
        version = "2.34.0";
        preBuild = "touch config/prod.exs";
        # We have to use the GitHub sources, as it otherwise tries to download
        # the locales at build time.
        src = fetchFromGitHub {
          owner = "erictapen";
          repo = "cldr";
          rev = "98c2675d5357373b3992bbd98d06524aa0524dc8";
          sha256 = "sha256-9DC2QpuS1Cu4YgtDEnZ6iOX4UDfMNCMJgq4Dc6/vPO4=";
        };
        postInstall = ''
          cp $src/priv/cldr/locales/* $out/lib/erlang/lib/ex_cldr-${old.version}/priv/cldr/locales/
        '';
      });
      ex_cldr_currencies = prev.ex_cldr_currencies.override {
        preBuild = "touch config/prod.exs";
      };
      ex_cldr_numbers = prev.ex_cldr_numbers.override {
        preBuild = "touch config/prod.exs";
      };
      ex_cldr_dates_times = prev.ex_cldr_dates_times.override {
        preBuild = "touch config/prod.exs";
      };
      ex_cldr_plugs = prev.ex_cldr_plugs.override {
        preBuild = "touch config/prod.exs";
      };
      # Upstream issue: https://github.com/bryanjos/geo_postgis/pull/87
      geo_postgis = prev.geo_postgis.overrideAttrs (old: {
        propagatedBuildInputs = old.propagatedBuildInputs ++ [ final.ecto ];
      });

      # The remainder are Git dependencies (and their deps) that are not supported by mix2nix currently.
      web_push_encryption = buildMix rec {
        name = "web_push_encryption";
        version = "0.3.1";
        src = fetchFromGitHub {
          owner = "danhper";
          repo = "elixir-web-push-encryption";
          rev = "70f00d06cbd88c9ac382e0ad2539e54448e9d8da";
          sha256 = "sha256-b4ZMrt/8n2sPUFtCDRTwXS1qWm5VlYdbx8qC0R0boOA=";
        };
        beamDeps = with final; [ httpoison jose ];
      };
      icalendar = buildMix rec {
        name = "icalendar";
        version = "unstable-2022-04-10";
        src = fetchFromGitHub {
          owner = "tcitworld";
          repo = name;
          rev = "1033d922c82a7223db0ec138e2316557b70ff49f";
          sha256 = "sha256-N3bJZznNazLewHS4c2B7LP1lgxd1wev+EWVlQ7rOwfU=";
        };
        beamDeps = with final; [ mix_test_watch ex_doc timex ];
      };
      erlport = buildRebar3 rec {
        name = "erlport";
        version = "0.10.1-compat";
        src = fetchFromGitHub {
          owner = "tcitworld";
          repo = name;
          rev = "04bcfd732fa458735001328b44e8b3a1764316a5";
          sha256 = "sha256-VzGnhHeD5zC+HyUt41FJfLH7Q7I9fJzfcqxTv7uLKnI=";
        };
      };

    });
  };

  preConfigure = ''
    export LANG=C.UTF-8 # fix elixir locale warning
  '';

  # Install the compiled js part
  preBuild = let
    js = callPackage ./js.nix { mobilizon-src = src; };
  in ''
    cp -a "${js}/libexec/mobilizon/deps/priv/static" ./priv
    chmod 770 -R ./priv
  '';

  postBuild = ''
    mix phx.digest --no-deps-check
  '';

  passthru = {
    tests.smoke-test = nixosTests.mobilizon;
    updateScript = writeShellScriptBin "update.sh" ''
      set -eou pipefail

      SRC=$(nix path-info .#mobilizon.src)
      ${yarn2nix}/bin/yarn2nix --lockfile="$SRC/js/yarn.lock" > pkgs/servers/mobilizon/yarn.nix
      ${mix2nix}/bin/mix2nix $SRC/mix.lock > pkgs/servers/mobilizon/mix.nix
      cat $SRC/js/package.json > pkgs/servers/mobilizon/package.json
    '';
  };

  meta = with lib; {
    description = "Mobilizon is an online tool to help manage your events, your profiles and your groups";
    homepage = "https://joinmobilizon.org/";
    license = licenses.agpl3Plus;
    maintainers = with maintainers; [ minijackson erictapen ];
  };
}
