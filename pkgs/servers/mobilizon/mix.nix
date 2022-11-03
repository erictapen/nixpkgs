{ lib, beamPackages, overrides ? (x: y: {}) }:

let
  buildRebar3 = lib.makeOverridable beamPackages.buildRebar3;
  buildMix = lib.makeOverridable beamPackages.buildMix;
  buildErlangMk = lib.makeOverridable beamPackages.buildErlangMk;

  self = packages // (overrides self packages);

  packages = with beamPackages; with self; {
    absinthe = buildMix rec {
      name = "absinthe";
      version = "1.7.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0hwnq3kwnaywz4b9kgz90gnf6b8nd1khqzrn9nfb5jdg35amnsjn";
      };

      beamDeps = [ dataloader decimal nimble_parsec telemetry ];
    };

    absinthe_phoenix = buildMix rec {
      name = "absinthe_phoenix";
      version = "2.0.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "139gnamfbba5hyk1fx1zf8vfr0j17fd9q0vxxp9cf39qbj91hsfk";
      };

      beamDeps = [ absinthe absinthe_plug decimal phoenix phoenix_html phoenix_pubsub ];
    };

    absinthe_plug = buildMix rec {
      name = "absinthe_plug";
      version = "1.5.8";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0nkfk5gqbg8yvlysgxfcak7y4lsy8q2jfyqyhql5hwvvciv43c5v";
      };

      beamDeps = [ absinthe plug ];
    };

    argon2_elixir = buildMix rec {
      name = "argon2_elixir";
      version = "3.0.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0mywrvzzm76glvajzxrdg6ka49xby30fpk9zl4dxamzm18kknxcb";
      };

      beamDeps = [ comeonin elixir_make ];
    };

    atomex = buildMix rec {
      name = "atomex";
      version = "0.5.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0gxb379zfx5qk0ljxvy225iplxfvxbgfx470h8wm1f6abwdqjj32";
      };

      beamDeps = [ xml_builder ];
    };

    bunt = buildMix rec {
      name = "bunt";
      version = "0.2.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "19bp6xh052ql3ha0v3r8999cvja5d2p6cph02mxphfaj4jsbyc53";
      };

      beamDeps = [];
    };

    cachex = buildMix rec {
      name = "cachex";
      version = "3.4.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1rfbbij81zmk6p75z33wg04mfcjqsxzzh67vclllvfjgmfqj609p";
      };

      beamDeps = [ eternal jumper sleeplocks unsafe ];
    };

    castore = buildMix rec {
      name = "castore";
      version = "0.1.18";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "01kawrhxcc0i7zkygss5ia8hmkzv39q4bnrwnf0fz0mpa9jazfv1";
      };

      beamDeps = [];
    };

    certifi = buildRebar3 rec {
      name = "certifi";
      version = "2.9.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0ha6vmf5p3xlbf5w1msa89frhvfk535rnyfybz9wdmh6vdms8v96";
      };

      beamDeps = [];
    };

    cldr_utils = buildMix rec {
      name = "cldr_utils";
      version = "2.19.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "084n92j1sjb12y8va801r318gjj4yjay28dbjgcg6w1y6rwhzlgv";
      };

      beamDeps = [ castore certifi decimal ];
    };

    codepagex = buildMix rec {
      name = "codepagex";
      version = "0.1.6";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0ndxsmalk70wqig1zzgl95g6mp2fb992y1l4y3nq3qnxjw84c88m";
      };

      beamDeps = [];
    };

    combine = buildMix rec {
      name = "combine";
      version = "0.10.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "06s5y8b0snr1s5ax9v3s7rc6c8xf5vj6878d1mc7cc07j0bvq78v";
      };

      beamDeps = [];
    };

    comeonin = buildMix rec {
      name = "comeonin";
      version = "5.3.3";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1pw4rhhsh8mwj26dkbxz2niih9j8pc3qijlpcl8jh208rg1cjf1y";
      };

      beamDeps = [];
    };

    connection = buildMix rec {
      name = "connection";
      version = "1.1.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1746n8ba11amp1xhwzp38yfii2h051za8ndxlwdykyqqljq1wb3j";
      };

      beamDeps = [];
    };

    cors_plug = buildMix rec {
      name = "cors_plug";
      version = "3.0.3";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "03c3vwp4bdk3sixica4mmg0vinmx8qdz2bmbby1x6bi7ijg7ab9z";
      };

      beamDeps = [ plug ];
    };

    cowboy = buildErlangMk rec {
      name = "cowboy";
      version = "2.9.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1phv0a1zbgk7imfgcm0dlacm7hbjcdygb0pqmx4s26jf9f9rywic";
      };

      beamDeps = [ cowlib ranch ];
    };

    cowboy_telemetry = buildRebar3 rec {
      name = "cowboy_telemetry";
      version = "0.4.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1pn90is3k9dq64wbijvzkqb6ldfqvwiqi7ymc8dx6ra5xv0vm63x";
      };

      beamDeps = [ cowboy telemetry ];
    };

    cowlib = buildRebar3 rec {
      name = "cowlib";
      version = "2.11.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1ac6pj3x4vdbsa8hvmbzpdfc4k0v1p102jbd39snai8wnah9sgib";
      };

      beamDeps = [];
    };

    credo = buildMix rec {
      name = "credo";
      version = "1.6.7";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1lvxzksdrc2lbl0rzrww4q5rmayf37q0phcpz2kyvxq7n2zi1qa1";
      };

      beamDeps = [ bunt file_system jason ];
    };

    dataloader = buildMix rec {
      name = "dataloader";
      version = "1.0.10";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0gwnrlrvylar2mdlgi9y9pylk8c3la3c2k71mjrg9pcsq3771kal";
      };

      beamDeps = [ ecto telemetry ];
    };

    db_connection = buildMix rec {
      name = "db_connection";
      version = "2.4.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0s1nx1gi96r8g7x8y7cklz8z823a6llh4fk996i5xxcr3flkrrag";
      };

      beamDeps = [ connection telemetry ];
    };

    decimal = buildMix rec {
      name = "decimal";
      version = "2.0.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0xzm8hfhn8q02rmg8cpgs68n5jz61wvqg7bxww9i1a6yanf6wril";
      };

      beamDeps = [];
    };

    dialyxir = buildMix rec {
      name = "dialyxir";
      version = "1.2.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0qw4zyd86fjwsav744jvz1wpdbmy9nz645xqr9s1d1bs88v221v1";
      };

      beamDeps = [ erlex ];
    };

    digital_token = buildMix rec {
      name = "digital_token";
      version = "0.4.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "09kfwvjmjzikhy7p7s5dgkl9x011xvsb052fqfrmpvhz3pvfsy51";
      };

      beamDeps = [ cldr_utils jason ];
    };

    doctor = buildMix rec {
      name = "doctor";
      version = "0.20.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0ql8cgn2k25al4f1hfznqd6mvg28xclk82y03lgc96fpyyyl7fin";
      };

      beamDeps = [ decimal ];
    };

    earmark_parser = buildMix rec {
      name = "earmark_parser";
      version = "1.4.29";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "00rmqvf3hkxfvkijqd624n0hn1xqims8h211xmm02fdi7qdsy0j9";
      };

      beamDeps = [];
    };

    eblurhash = buildRebar3 rec {
      name = "eblurhash";
      version = "1.2.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0k040pj8hlm8mwy0ra459hk35v9gfsvvgp596nl27q2dj00cl84c";
      };

      beamDeps = [];
    };

    ecto = buildMix rec {
      name = "ecto";
      version = "3.9.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "015k9vsngl01zzj5p9iw439rsbcjdjrq2bzryy8gg3b46vbv62y8";
      };

      beamDeps = [ decimal jason telemetry ];
    };

    ecto_autoslug_field = buildMix rec {
      name = "ecto_autoslug_field";
      version = "3.0.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "03ycq3c6sm79sx5cxsbv3yc1zvx0ss2a8mig0qr33wc5rz3m5hlf";
      };

      beamDeps = [ ecto slugger ];
    };

    ecto_enum = buildMix rec {
      name = "ecto_enum";
      version = "1.4.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1r2ffrr020fhfviqn21cv06sd3sp4bf1jra0xrgb3hl1f445rdcg";
      };

      beamDeps = [ ecto ecto_sql postgrex ];
    };

    ecto_shortuuid = buildMix rec {
      name = "ecto_shortuuid";
      version = "0.1.3";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "152299sdkpmg3wlcyf9lyfp2r515c5lvqnnmjkg6alhjsz7ch5fj";
      };

      beamDeps = [ ecto shortuuid ];
    };

    ecto_sql = buildMix rec {
      name = "ecto_sql";
      version = "3.9.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0lv4b45j0bja98q0qhlp97a7zvb0g7x2bgkqr721m2rv0whggwx8";
      };

      beamDeps = [ db_connection ecto postgrex telemetry ];
    };

    elixir_feed_parser = buildMix rec {
      name = "elixir_feed_parser";
      version = "2.1.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "13x2rgckh41zkgbwg63wb7lvyy5xmn7vqq3i7nvy6virggz64g1d";
      };

      beamDeps = [ timex ];
    };

    elixir_make = buildMix rec {
      name = "elixir_make";
      version = "0.6.3";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "05ppvbhqi5m9zk1c4xnrki814sqhxrc7d1dpvfmwm2v7qm8xdjzm";
      };

      beamDeps = [];
    };

    erlex = buildMix rec {
      name = "erlex";
      version = "0.2.6";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0x8c1j62y748ldvlh46sxzv5514rpzm809vxn594vd7y25by5lif";
      };

      beamDeps = [];
    };

    erlport = buildRebar3 rec {
      name = "erlport";
      version = "0.10.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "06594wi1grqqlbj2xqhh9wzc0wvw03a09gd2r0dis4rans61x4rl";
      };

      beamDeps = [];
    };

    eternal = buildMix rec {
      name = "eternal";
      version = "1.2.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "10p7m6kv2z2c16gw36wgiwnkykss4lfkmm71llxp09ipkhmy77rc";
      };

      beamDeps = [];
    };

    ex_cldr = buildMix rec {
      name = "ex_cldr";
      version = "2.34.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "12150ymndggazavrbd3276kf04iwip9qz40dmy6sn904b1yxy9nh";
      };

      beamDeps = [ castore certifi cldr_utils decimal gettext jason nimble_parsec ];
    };

    ex_cldr_calendars = buildMix rec {
      name = "ex_cldr_calendars";
      version = "1.21.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "13q9qhqwlqh6w9l5hvppy9yci951cijgk5a968l6ihzrf1xp7s4c";
      };

      beamDeps = [ ex_cldr_numbers ex_doc jason ];
    };

    ex_cldr_currencies = buildMix rec {
      name = "ex_cldr_currencies";
      version = "2.14.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1lbc8vhmxgm5vr7m07hgxq5axxf014iavzn2xlfppjfd0cqm6w69";
      };

      beamDeps = [ ex_cldr jason ];
    };

    ex_cldr_dates_times = buildMix rec {
      name = "ex_cldr_dates_times";
      version = "2.13.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1swqbh7slh8rqrg4qgysjcfyf9271qqnw740wg7cf3lx76mzldw9";
      };

      beamDeps = [ ex_cldr_calendars ex_cldr_numbers jason ];
    };

    ex_cldr_languages = buildMix rec {
      name = "ex_cldr_languages";
      version = "0.3.3";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0yj4rj4r0wdzhrwkg1xdg1x28d1pp3kk8fr45n3v9d5pfbpizyr2";
      };

      beamDeps = [ ex_cldr jason ];
    };

    ex_cldr_numbers = buildMix rec {
      name = "ex_cldr_numbers";
      version = "2.28.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1lj93k6lazgqln04iccncmxk348gvbhqq12bqnjkmpxfd3v2yd43";
      };

      beamDeps = [ decimal digital_token ex_cldr ex_cldr_currencies jason ];
    };

    ex_cldr_plugs = buildMix rec {
      name = "ex_cldr_plugs";
      version = "1.2.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "13ngn58bx8f6yqgkb0c1vjbf5n9hr78z4gy949iyzqm7syg284g1";
      };

      beamDeps = [ ex_cldr gettext jason plug ];
    };

    ex_doc = buildMix rec {
      name = "ex_doc";
      version = "0.29.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1caxmx8zdhjbkm625l607xmljbbrqxhk68kqs8spsryapfwav5ph";
      };

      beamDeps = [ earmark_parser makeup_elixir makeup_erlang ];
    };

    ex_ical = buildMix rec {
      name = "ex_ical";
      version = "0.2.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1yxyflmkvmglks7whmbz944kyq6qljjpki666dk9w9g058xlfxnv";
      };

      beamDeps = [ timex ];
    };

    ex_machina = buildMix rec {
      name = "ex_machina";
      version = "2.7.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1y2v4j1zg1ji8q8di0fxpc3z3n2jmbnc85d6hx68j4fykfisg6j1";
      };

      beamDeps = [ ecto ecto_sql ];
    };

    ex_optimizer = buildMix rec {
      name = "ex_optimizer";
      version = "0.1.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "11i2npj15w3a91lxdpf9ll7lpdv99zf7y9bg5yz6d2ympicw1xg6";
      };

      beamDeps = [ file_info ];
    };

    ex_unit_notifier = buildMix rec {
      name = "ex_unit_notifier";
      version = "1.2.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0cp3msbal2pc4w1bydibqs91r7qdl60xgi5fy3bqmrhdsp4l907k";
      };

      beamDeps = [];
    };

    excoveralls = buildMix rec {
      name = "excoveralls";
      version = "0.15.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1wbnygccvibx2jwcw55hmy05kqbspii3bjgkl8qclzmj0qh92ccn";
      };

      beamDeps = [ hackney jason ];
    };

    exgravatar = buildMix rec {
      name = "exgravatar";
      version = "2.0.3";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1q80jcrnagivsjr9mz0z9h4bwlf0xyyx6ijl7szd74c9ppwqz8dc";
      };

      beamDeps = [];
    };

    export = buildMix rec {
      name = "export";
      version = "0.1.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "07q2l7f9yr3bd3xqc5q1qa9qrhnjzc9xnjrg6lj1hgq5yi7l99rx";
      };

      beamDeps = [ erlport ];
    };

    fast_html = buildMix rec {
      name = "fast_html";
      version = "2.0.5";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "01k51qri44535b1hwixlxk7151vph6vapswlfq918g245544ypv0";
      };

      beamDeps = [ elixir_make nimble_pool ];
    };

    fast_sanitize = buildMix rec {
      name = "fast_sanitize";
      version = "0.2.3";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1qjnbs63q0d95dqhh2r9sz3zpg2y4hjy23kxsqanwf6h21njibg8";
      };

      beamDeps = [ fast_html plug ];
    };

    file_info = buildMix rec {
      name = "file_info";
      version = "0.0.4";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "19c14xv0xzbl3m6y5p7dlxn8sfqi9bff8pv722837ff8q80svrsh";
      };

      beamDeps = [ mimetype_parser ];
    };

    file_system = buildMix rec {
      name = "file_system";
      version = "0.2.10";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1p0myxmnjjds8bbg69dd6fvhk8q3n7lb78zd4qvmjajnzgdmw6a1";
      };

      beamDeps = [];
    };

    floki = buildMix rec {
      name = "floki";
      version = "0.33.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1ihjszkd5pbgzvp1rgvchzngn2p5n6h8ag141zrzs4sz2byka426";
      };

      beamDeps = [ html_entities ];
    };

    gen_smtp = buildRebar3 rec {
      name = "gen_smtp";
      version = "1.2.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0yb7541zx0x76gzk0m1m8fkl6524jhl8rxc59l6g5a5wh1b3gq2y";
      };

      beamDeps = [ ranch ];
    };

    geo = buildMix rec {
      name = "geo";
      version = "3.4.3";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0ljmnbz3a0kh0hri64df87c8zic9xk6bxqffcfqchzj3wn92hgz2";
      };

      beamDeps = [ jason ];
    };

    geo_postgis = buildMix rec {
      name = "geo_postgis";
      version = "3.4.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1m5abb98a0kl24ysmawznqz2m5vylm17q88rvd35b003gzwwkn28";
      };

      beamDeps = [ geo jason postgrex ];
    };

    geohax = buildMix rec {
      name = "geohax";
      version = "1.0.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0912z8fn86r7sxgbvhmzfqvbxc96v5awklhmqrkwnfi10pwz4gl9";
      };

      beamDeps = [];
    };

    geolix = buildMix rec {
      name = "geolix";
      version = "2.0.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1pq1qcjaqsnnvsbgzzbfdj290n9mkp808cj45kppvfyhircbyhl7";
      };

      beamDeps = [];
    };

    geolix_adapter_mmdb2 = buildMix rec {
      name = "geolix_adapter_mmdb2";
      version = "0.6.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "16r6q2qmgdpj5pvb36s3rgfd1qm6rnzp8szqzp7i18z8x8prdzq6";
      };

      beamDeps = [ geolix mmdb2_decoder ];
    };

    gettext = buildMix rec {
      name = "gettext";
      version = "0.20.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0ggb458h60ch3inndqp9xhbailhb0jkq3xnp85sa94sy8dvv20qw";
      };

      beamDeps = [];
    };

    guardian = buildMix rec {
      name = "guardian";
      version = "2.3.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0pi0asb5wfr2b8ajbk6iaw6xshsl41nrxsfv4lmjpcn29zksrlyf";
      };

      beamDeps = [ jose plug ];
    };

    guardian_db = buildMix rec {
      name = "guardian_db";
      version = "2.1.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0w0d9bwsiz7hw9i7b3v8gpjsvblzhbkcnnpxlzrrbhwjmi1xbrzq";
      };

      beamDeps = [ ecto ecto_sql guardian postgrex ];
    };

    guardian_phoenix = buildMix rec {
      name = "guardian_phoenix";
      version = "2.0.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1350z7sk4m8n2wxllnjm07gzpm8ybm3811i23wijn68mcwj3kx11";
      };

      beamDeps = [ guardian phoenix ];
    };

    hackney = buildRebar3 rec {
      name = "hackney";
      version = "1.18.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "13hja14kig5jnzcizpdghj68i88f0yd9wjdfjic9nzi98kzxmv54";
      };

      beamDeps = [ certifi idna metrics mimerl parse_trans ssl_verify_fun unicode_util_compat ];
    };

    haversine = buildMix rec {
      name = "haversine";
      version = "0.1.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0q3hc16zd5pvz9xvhk5692v1fkk3fg42cw536yaaa65wjpl4ip2l";
      };

      beamDeps = [];
    };

    html_entities = buildMix rec {
      name = "html_entities";
      version = "0.5.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1k7xyj0q38ms3n5hbn782pa6w1vgd6biwlxr4db6319l828a6fy5";
      };

      beamDeps = [];
    };

    http_signatures = buildMix rec {
      name = "http_signatures";
      version = "0.1.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "18s2b5383xl2qjijkxag4mvwk2p5kv2fw58c9ii7pk12fc08lfyc";
      };

      beamDeps = [];
    };

    httpoison = buildMix rec {
      name = "httpoison";
      version = "1.8.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "08crb48yz7r7w00pzw9gfk862g99z2ma2x6awab0rqvjd7951crb";
      };

      beamDeps = [ hackney ];
    };

    idna = buildRebar3 rec {
      name = "idna";
      version = "6.1.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1sjcjibl34sprpf1dgdmzfww24xlyy34lpj7mhcys4j4i6vnwdwj";
      };

      beamDeps = [ unicode_util_compat ];
    };

    inet_cidr = buildMix rec {
      name = "inet_cidr";
      version = "1.0.4";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1g61i08cizr99ivy050lv8fmvnwia9zmipfvlwff8jkhi40x78k4";
      };

      beamDeps = [];
    };

    ip_reserved = buildMix rec {
      name = "ip_reserved";
      version = "0.1.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1zm4820yvdashvz14p9jhv2bwc1hshvyym1zx84yzjhiwavd5z2m";
      };

      beamDeps = [ inet_cidr ];
    };

    jason = buildMix rec {
      name = "jason";
      version = "1.4.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0891p2yrg3ri04p302cxfww3fi16pvvw1kh4r91zg85jhl87k8vr";
      };

      beamDeps = [ decimal ];
    };

    jose = buildMix rec {
      name = "jose";
      version = "1.11.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1lj715gzl022yc47qsg9712x8nc9wi7x70msv8c3lpym92y3y54q";
      };

      beamDeps = [];
    };

    jumper = buildMix rec {
      name = "jumper";
      version = "1.0.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0cvlbfkapkvbwaijmjq3cxg5m6yv4rh69wvss9kfj862i83mk31i";
      };

      beamDeps = [];
    };

    junit_formatter = buildMix rec {
      name = "junit_formatter";
      version = "3.3.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0ax79m9fn7asbfjk523vvawnvbn2nbhgvnm6j6xdh5ac9fzca7vn";
      };

      beamDeps = [];
    };

    linkify = buildMix rec {
      name = "linkify";
      version = "0.5.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "11mbbqm7yi6rhza5d2hd4fxkhdy3ik5n7sybj0n9bn0q09lsqwcd";
      };

      beamDeps = [];
    };

    makeup = buildMix rec {
      name = "makeup";
      version = "1.1.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "19jpprryixi452jwhws3bbks6ki3wni9kgzah3srg22a3x8fsi8a";
      };

      beamDeps = [ nimble_parsec ];
    };

    makeup_elixir = buildMix rec {
      name = "makeup_elixir";
      version = "0.16.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1rrqydcq2bshs577z7jbgdnrlg7cpnzc8n48kap4c2ln2gfcpci8";
      };

      beamDeps = [ makeup nimble_parsec ];
    };

    makeup_erlang = buildMix rec {
      name = "makeup_erlang";
      version = "0.1.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1fvw0zr7vqd94vlj62xbqh0yrih1f7wwnmlj62rz0klax44hhk8p";
      };

      beamDeps = [ makeup ];
    };

    meck = buildRebar3 rec {
      name = "meck";
      version = "0.9.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "09jq0jrsd3dwzjlnwqjv6m9r2rijgiv57yja6jl41p2p2db4yd41";
      };

      beamDeps = [];
    };

    metrics = buildRebar3 rec {
      name = "metrics";
      version = "1.0.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "05lz15piphyhvvm3d1ldjyw0zsrvz50d2m5f2q3s8x2gvkfrmc39";
      };

      beamDeps = [];
    };

    mime = buildMix rec {
      name = "mime";
      version = "2.0.3";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0szzdfalafpawjrrwbrplhkgxjv8837mlxbkpbn5xlj4vgq0p8r7";
      };

      beamDeps = [];
    };

    mimerl = buildRebar3 rec {
      name = "mimerl";
      version = "1.2.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "08wkw73dy449n68ssrkz57gikfzqk3vfnf264s31jn5aa1b5hy7j";
      };

      beamDeps = [];
    };

    mimetype_parser = buildMix rec {
      name = "mimetype_parser";
      version = "0.1.3";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0lm8yzcmg17nhvr4p4dbmamb280a9dzqx4rwv66ffz40cz2q13vx";
      };

      beamDeps = [];
    };

    mix_test_watch = buildMix rec {
      name = "mix_test_watch";
      version = "1.1.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1hrfh7hg3iwmvzwwyshdddgjxwc2ci898lyak7c0zdybfv2b3djj";
      };

      beamDeps = [ file_system ];
    };

    mmdb2_decoder = buildMix rec {
      name = "mmdb2_decoder";
      version = "3.0.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "17amvw553l6drkaszc5xpf8rcz4fwzpm8kwl5mw29j7si3rz0sii";
      };

      beamDeps = [];
    };

    mock = buildMix rec {
      name = "mock";
      version = "0.3.7";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0p3yrx049fdw88kjidngd2lkwqkkyck5r51ng2dxj7z41539m92d";
      };

      beamDeps = [ meck ];
    };

    mogrify = buildMix rec {
      name = "mogrify";
      version = "0.9.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "17b9dy40rq3rwn7crjggjafibxz4ys4nqq81adcf486af3yi13f1";
      };

      beamDeps = [];
    };

    mox = buildMix rec {
      name = "mox";
      version = "1.0.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1wpyh6wp76lyx0q2cys23rpmci4gj1pqwnqvfk467xxanchlk1pr";
      };

      beamDeps = [];
    };

    nimble_csv = buildMix rec {
      name = "nimble_csv";
      version = "1.2.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0amij6y3pgkpazhjr3madrn9c9lv6malq11ln1w82562zhbq2qnh";
      };

      beamDeps = [];
    };

    nimble_parsec = buildMix rec {
      name = "nimble_parsec";
      version = "1.2.3";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1c3hnppmjkwnqrc9vvm72kpliav0mqyyk4cjp7vsqccikgiqkmy8";
      };

      beamDeps = [];
    };

    nimble_pool = buildMix rec {
      name = "nimble_pool";
      version = "0.2.6";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0gv59waa505mz2gi956sj1aa6844c65w2dp2qh2jfgsx15am0w8w";
      };

      beamDeps = [];
    };

    oauth2 = buildMix rec {
      name = "oauth2";
      version = "2.0.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0ljcyzn8lb5251sshddiwsiw7p8f1m9znw1iw35xpg05s7a20kn6";
      };

      beamDeps = [ hackney ];
    };

    oauther = buildMix rec {
      name = "oauther";
      version = "1.3.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0kn0msy3z0rx7l4pp8zc5r7yhvmwa3sscr08gfi2rivmm278isvq";
      };

      beamDeps = [];
    };

    oban = buildMix rec {
      name = "oban";
      version = "2.13.4";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "097isyz3mlix1qkazsgbhgvx6sp02rvs2xdviy9dgqh9nj16zlm7";
      };

      beamDeps = [ ecto_sql jason postgrex telemetry ];
    };

    paasaa = buildMix rec {
      name = "paasaa";
      version = "0.6.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0blzqack3i8w1f0hjqjgsybqjazcyf54dv3anbnk225c3g1dybbk";
      };

      beamDeps = [];
    };

    parse_trans = buildRebar3 rec {
      name = "parse_trans";
      version = "3.3.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "12w8ai6b5s6b4hnvkav7hwxd846zdd74r32f84nkcmjzi1vrbk87";
      };

      beamDeps = [];
    };

    phoenix = buildMix rec {
      name = "phoenix";
      version = "1.6.15";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0wh6s8id3b4c4hgiawq995p192wxsws4sr4bm1g7b55kyvxvj2np";
      };

      beamDeps = [ castore jason phoenix_pubsub phoenix_view plug plug_cowboy plug_crypto telemetry ];
    };

    phoenix_ecto = buildMix rec {
      name = "phoenix_ecto";
      version = "4.4.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1h9wnjmxns8y8dsr0r41ks66gscaqm7ivk4gsh5y07nkiralx1h9";
      };

      beamDeps = [ ecto phoenix_html plug ];
    };

    phoenix_html = buildMix rec {
      name = "phoenix_html";
      version = "3.2.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0ky5idgid1psz6hmh2b2kmj6n974axww74hrxwv02p6jasx9gv1n";
      };

      beamDeps = [ plug ];
    };

    phoenix_live_reload = buildMix rec {
      name = "phoenix_live_reload";
      version = "1.4.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0vxfv9ndrcmlwwfnjgcn3p1b9drlf8v8bxb8b75n2fqisb10zgxy";
      };

      beamDeps = [ file_system phoenix ];
    };

    phoenix_live_view = buildMix rec {
      name = "phoenix_live_view";
      version = "0.18.3";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1cl1rsfhg4aqazd2nswb3c3an04g7hwnacq8nzf1gq36m1vm3168";
      };

      beamDeps = [ jason phoenix phoenix_html phoenix_template phoenix_view telemetry ];
    };

    phoenix_pubsub = buildMix rec {
      name = "phoenix_pubsub";
      version = "2.1.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1nfqrmbrq45if9pgk6g6vqiply2sxc40is3bfanphn7a3rnpqdl1";
      };

      beamDeps = [];
    };

    phoenix_swoosh = buildMix rec {
      name = "phoenix_swoosh";
      version = "1.1.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0gbwv2ffbxh8afsvdd221lhmpcijjjxls9zkzn060jwszl5g30ma";
      };

      beamDeps = [ hackney phoenix phoenix_html phoenix_view swoosh ];
    };

    phoenix_template = buildMix rec {
      name = "phoenix_template";
      version = "1.0.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0ms39n5s6kh532s20yxzj7sh0rz5lslh09ibq5j21lkglacny1hv";
      };

      beamDeps = [ phoenix_html ];
    };

    phoenix_view = buildMix rec {
      name = "phoenix_view";
      version = "2.0.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1xm6p2r0rmspqax83s6rzqwx5gvbamy8cjwi533l3wy5xwn8wdbc";
      };

      beamDeps = [ phoenix_html phoenix_template ];
    };

    plug = buildMix rec {
      name = "plug";
      version = "1.14.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "056wkb1b17mh5h9ncs2vbswvpjsm2iqc580nmyrvgznlqwr080mz";
      };

      beamDeps = [ mime plug_crypto telemetry ];
    };

    plug_cowboy = buildMix rec {
      name = "plug_cowboy";
      version = "2.6.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "19jgv5dm53hv5aqgxxzr3fnrpgfll9ics199swp6iriwfl5z4g07";
      };

      beamDeps = [ cowboy cowboy_telemetry plug ];
    };

    plug_crypto = buildMix rec {
      name = "plug_crypto";
      version = "1.2.3";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "18plj2idhp3f0nmqyjjf2rzj849l3br0797m8ln20p5dqscj0rxm";
      };

      beamDeps = [];
    };

    postgrex = buildMix rec {
      name = "postgrex";
      version = "0.16.5";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1s5jbwfzsdsyvlwgx3bqlfwilj2c468wi3qxq0c2d23fvhwxdspd";
      };

      beamDeps = [ connection db_connection decimal jason ];
    };

    progress_bar = buildMix rec {
      name = "progress_bar";
      version = "2.0.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "11wgy5qxr7yn3f299v2rlab6vjyqas13fag7jjha6jgil9cfn695";
      };

      beamDeps = [ decimal ];
    };

    ranch = buildRebar3 rec {
      name = "ranch";
      version = "1.8.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1rfz5ld54pkd2w25jadyznia2vb7aw9bclck21fizargd39wzys9";
      };

      beamDeps = [];
    };

    remote_ip = buildMix rec {
      name = "remote_ip";
      version = "1.0.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "01zrrb4fakhf8wsvsivis0z3y8mbssg65adn9civahqcwpacm7wy";
      };

      beamDeps = [ combine plug ];
    };

    replug = buildMix rec {
      name = "replug";
      version = "0.1.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0q7sikahnvmr8jw9ziklh2am73h9cilhq1j697z59s24x5bpl7zp";
      };

      beamDeps = [ plug ];
    };

    sentry = buildMix rec {
      name = "sentry";
      version = "8.0.6";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "10qqkqvykw8v3xdw9j19jgg3kwjfdrp9sz3wg0vk2bqnf822s6h5";
      };

      beamDeps = [ hackney jason plug plug_cowboy ];
    };

    shortuuid = buildMix rec {
      name = "shortuuid";
      version = "2.1.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0lyk7bv89v3wfymg9jhml12rygi15s3wwpi7nscm3sh0fprw9c6r";
      };

      beamDeps = [];
    };

    sitemapper = buildMix rec {
      name = "sitemapper";
      version = "0.7.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0gr23zpwih1z2hycpbxgjnlvpg721f5z8savmh87zzp9wn2adxv0";
      };

      beamDeps = [ xml_builder ];
    };

    sleeplocks = buildRebar3 rec {
      name = "sleeplocks";
      version = "1.1.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1q823i5bisc83pyssgrqkggyxiasm7b8dygzj2r943adzyp3gvl4";
      };

      beamDeps = [];
    };

    slugger = buildMix rec {
      name = "slugger";
      version = "0.3.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1fmgnl4ydq4ivbfk1a934vcn0d0wb24lhnvcmqg5sq0jwz8dxl10";
      };

      beamDeps = [];
    };

    sobelow = buildMix rec {
      name = "sobelow";
      version = "0.11.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0g558rki9198a2plgdadsbjxaalyh6nhma84jf0g95pzgqx3d5wq";
      };

      beamDeps = [ jason ];
    };

    ssl_verify_fun = buildRebar3 rec {
      name = "ssl_verify_fun";
      version = "1.1.6";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1026l1z1jh25z8bfrhaw0ryk5gprhrpnirq877zqhg253x3x5c5x";
      };

      beamDeps = [];
    };

    struct_access = buildMix rec {
      name = "struct_access";
      version = "1.1.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0sjq5v0zdqx7iqs0hqa7lfqzxf4jzi8rb409aywq2q12q3f13i74";
      };

      beamDeps = [];
    };

    sweet_xml = buildMix rec {
      name = "sweet_xml";
      version = "0.7.3";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1fpmwhqgvakvdpbwmmyh31ays3hzhnm9766xqyzp9zmkl5kwh471";
      };

      beamDeps = [];
    };

    swoosh = buildMix rec {
      name = "swoosh";
      version = "1.8.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1nxpcwq7ynvqjp65z544dvdfw7jx9k0m58w4kb0bdbdg1rsvln6h";
      };

      beamDeps = [ cowboy gen_smtp hackney jason mime plug_cowboy telemetry ];
    };

    telemetry = buildRebar3 rec {
      name = "telemetry";
      version = "1.1.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0j6zq3y7xz768djz25x55gampyhd9nv6ax9dzx67f52nyyhv49xp";
      };

      beamDeps = [];
    };

    tesla = buildMix rec {
      name = "tesla";
      version = "1.4.4";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0mv48vgby1fv9b2npc0ird3y4isr10np3a3yas3v5hfyz54kll6m";
      };

      beamDeps = [ castore hackney jason mime telemetry ];
    };

    timex = buildMix rec {
      name = "timex";
      version = "3.7.9";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1q8chs28k5my6nzzm61rhc2l9wkhzfn0kiqzf87i71xvwn11asb4";
      };

      beamDeps = [ combine gettext tzdata ];
    };

    tz_world = buildMix rec {
      name = "tz_world";
      version = "1.2.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1y4w3nybk0n20iv2ibaj0mngl1vajy31rxpdm6b2954n19gjbp9w";
      };

      beamDeps = [ castore certifi geo jason ];
    };

    tzdata = buildMix rec {
      name = "tzdata";
      version = "1.1.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "11wpm1mjla8hbkb5mssprg3gsq1v24s8m8nyk3hx5z7aaa1yr756";
      };

      beamDeps = [ hackney ];
    };

    ueberauth = buildMix rec {
      name = "ueberauth";
      version = "0.10.3";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1lz660mr1sgv302f6qkr85swpd2jgs7255fg70h7zsb4dimg750k";
      };

      beamDeps = [ plug ];
    };

    ueberauth_cas = buildMix rec {
      name = "ueberauth_cas";
      version = "2.3.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "08g3kdcx2zxv963nqvwspsh1pqiiclx4hrwsm82jyz11kqmsws2h";
      };

      beamDeps = [ httpoison sweet_xml ueberauth ];
    };

    ueberauth_discord = buildMix rec {
      name = "ueberauth_discord";
      version = "0.7.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1d4nk3hshwj1ybr5ywz95m6qrrp0f2jcnyjbvbmdqkdv3bwqxyfn";
      };

      beamDeps = [ oauth2 ueberauth ];
    };

    ueberauth_facebook = buildMix rec {
      name = "ueberauth_facebook";
      version = "0.10.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1a1pjlxa86v5kbqsxb7lcggbs45pq6380zpppy5dll0wdgbfb35z";
      };

      beamDeps = [ oauth2 ueberauth ];
    };

    ueberauth_github = buildMix rec {
      name = "ueberauth_github";
      version = "0.8.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0jm7wxak2xr20zycpplhh1z1v3vq81zri57gs3drpsj5p4q62g8l";
      };

      beamDeps = [ oauth2 ueberauth ];
    };

    ueberauth_gitlab_strategy = buildMix rec {
      name = "ueberauth_gitlab_strategy";
      version = "0.4.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "07h94s9fy46mqkn4g3wd62lkpgpjfcdk1cd60myc0qxh9dwjwvp8";
      };

      beamDeps = [ oauth2 ueberauth ];
    };

    ueberauth_google = buildMix rec {
      name = "ueberauth_google";
      version = "0.10.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "04js5qrydc7f3szphcwcccfsrrhyqqii5rhc4j8diqmmkms8gygw";
      };

      beamDeps = [ oauth2 ueberauth ];
    };

    ueberauth_keycloak_strategy = buildMix rec {
      name = "ueberauth_keycloak_strategy";
      version = "0.3.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0cfvi6wnxw4f06clf9hcxqzwcfmhhc2j16cq59r3jpnd12nsp86i";
      };

      beamDeps = [ oauth2 ueberauth ];
    };

    ueberauth_twitter = buildMix rec {
      name = "ueberauth_twitter";
      version = "0.4.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0rb0n41s60b89385ggzvags3mxgbp4iv7gxympqpdyd3w6iqxjl3";
      };

      beamDeps = [ httpoison oauther ueberauth ];
    };

    unicode_util_compat = buildRebar3 rec {
      name = "unicode_util_compat";
      version = "0.7.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "08952lw8cjdw8w171lv8wqbrxc4rcmb3jhkrdb7n06gngpbfdvi5";
      };

      beamDeps = [];
    };

    unplug = buildMix rec {
      name = "unplug";
      version = "1.0.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0fkwkg6qm2lsvil8xdba9mmcgi5iw41w42dqhm72shdab1bshwfi";
      };

      beamDeps = [ plug ];
    };

    unsafe = buildMix rec {
      name = "unsafe";
      version = "1.0.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1rahpgz1lsd66r7ycns1ryz2qymamz1anrlps986900lsai2jxvc";
      };

      beamDeps = [];
    };

    vite_phx = buildMix rec {
      name = "vite_phx";
      version = "0.3.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0dn9bygcsjyxllw2cxm9iggmqjyx9i67dix2y07ljcd1jih75c88";
      };

      beamDeps = [ jason phoenix ];
    };

    xml_builder = buildMix rec {
      name = "xml_builder";
      version = "2.2.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1jb29bv6hgz7z2bdw119am6z17nkg1033936h4smsmhpp4pxarlx";
      };

      beamDeps = [];
    };
  };
in self

