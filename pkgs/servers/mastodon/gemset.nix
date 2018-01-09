{
  actioncable = {
    dependencies = ["actionpack" "nio4r" "websocket-driver"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "05k9slwr3bjc6n564l9qr5b22ss2ig5sf1k3rf4fx8kacgsnina7";
      type = "gem";
    };
    version = "5.1.4";
  };
  actionmailer = {
    dependencies = ["actionpack" "actionview" "activejob" "mail" "rails-dom-testing"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1scqqmpbs6f56qs3k4n1m21j2sc9n3b8fs00rh1zi16j1f2rirss";
      type = "gem";
    };
    version = "5.1.4";
  };
  actionpack = {
    dependencies = ["actionview" "activesupport" "rack" "rack-test" "rails-dom-testing" "rails-html-sanitizer"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ip4al2k6q814i7m1ydank9jdl2k8ckmrg1bjffz28qr0m3ygl7m";
      type = "gem";
    };
    version = "5.1.4";
  };
  actionview = {
    dependencies = ["activesupport" "builder" "erubi" "rails-dom-testing" "rails-html-sanitizer"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1hhpljazbc89fpfxdz72vxgsnv236sqk8n92ykk1hy1khs53jbrh";
      type = "gem";
    };
    version = "5.1.4";
  };
  active_model_serializers = {
    dependencies = ["actionpack" "activemodel" "case_transform" "jsonapi-renderer"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "06arlz90rspfz899g3y2mrp5vwv6h6yahp936yqvl83d6jjpry12";
      type = "gem";
    };
    version = "0.10.7";
  };
  active_record_query_trace = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1aharmy1fcd0plv9k0i2dk5icvnlww8n43ia8xahfkcask0cpidh";
      type = "gem";
    };
    version = "1.5.4";
  };
  activejob = {
    dependencies = ["activesupport" "globalid"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1jkbrfhhnwww468sw6x64pwcpjskxjnwas2gfzvgg4km9bglz0gp";
      type = "gem";
    };
    version = "5.1.4";
  };
  activemodel = {
    dependencies = ["activesupport"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0qws28wsgbh4hyx92zjip979xczq7dsblfhplzrxsjg1aj7ss220";
      type = "gem";
    };
    version = "5.1.4";
  };
  activerecord = {
    dependencies = ["activemodel" "activesupport" "arel"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gj1nap7dn8fcx1nvni79zvl034jp6113sjjrr3hq1v2r5s7igl9";
      type = "gem";
    };
    version = "5.1.4";
  };
  activesupport = {
    dependencies = ["concurrent-ruby" "i18n" "minitest" "tzinfo"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0sgf4rsfr7jcaqsx0wwzx4l4k9xsjlwv0mzl08pxiyp1qzyx8scr";
      type = "gem";
    };
    version = "5.1.4";
  };
  addressable = {
    dependencies = ["public_suffix"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0viqszpkggqi8hq87pqp0xykhvz60g99nwmkwsb0v45kc2liwxvk";
      type = "gem";
    };
    version = "2.5.2";
  };
  airbrussh = {
    dependencies = ["sshkit"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0yp1sl5n94ksxpwmaajflbdls45s81hw4spgz01h19xs2zrvv8wl";
      type = "gem";
    };
    version = "1.3.0";
  };
  annotate = {
    dependencies = ["activerecord" "rake"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "079y33iy65nv1cqnh1zmi3v2y9yp1z3zzsf2wdh35m3c80v6kaz4";
      type = "gem";
    };
    version = "2.7.2";
  };
  arel = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0nw0qbc6ph625p6n3maqq9f527vz3nbl0hk72fbyka8jzsmplxzl";
      type = "gem";
    };
    version = "8.0.0";
  };
  ast = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0pp82blr5fakdk27d1d21xq9zchzb6vmyb1zcsl520s3ygvprn8m";
      type = "gem";
    };
    version = "2.3.0";
  };
  attr_encrypted = {
    dependencies = ["encryptor"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1dikbf55wjqyzfb9p4xjkkkajwan569pmzljdf9c1fy4a94cd13d";
      type = "gem";
    };
    version = "3.0.3";
  };
  av = {
    dependencies = ["cocaine"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1swakpybf6g0nzfdn6q4s9c97ysc3i4ffk84dw8v2321fpvc8gqq";
      type = "gem";
    };
    version = "0.9.0";
  };
  aws-sdk = {
    dependencies = ["aws-sdk-resources"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1cqdj6jv4y9rd0m79s3ydj20w20n4dwwdnyhjdrv56307rnb9bcr";
      type = "gem";
    };
    version = "2.10.100";
  };
  aws-sdk-core = {
    dependencies = ["aws-sigv4" "jmespath"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "18aqvi7nw1cwl5p68cndcknw7yzpxbzywi670xxxjh35wpqid688";
      type = "gem";
    };
    version = "2.10.100";
  };
  aws-sdk-resources = {
    dependencies = ["aws-sdk-core"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0775klvwrdr0b0hwp0xgcp9lf3hrd5w6a1am17jcdcy0gi4igiky";
      type = "gem";
    };
    version = "2.10.100";
  };
  aws-sigv4 = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0g0qzy2xkmy6cr1qcz0k53fqgja1732h93vnna4fq5mz55lzlvkl";
      type = "gem";
    };
    version = "1.0.2";
  };
  bcrypt = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1d254sdhdj6mzak3fb5x3jam8b94pvl1srladvs53j05a89j5z50";
      type = "gem";
    };
    version = "3.1.11";
  };
  better_errors = {
    dependencies = ["coderay" "erubi" "rack"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1zgv1yr4g8x2qnxlai0g8ygwd2mh0mxi0cqcy8a6912wra0hs1k2";
      type = "gem";
    };
    version = "2.4.0";
  };
  binding_of_caller = {
    dependencies = ["debug_inspector"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1h1f7x2jmrcyhm4p3vxs6m6955pln3hhmm09iq8p44jalvba6ay3";
      type = "gem";
    };
    version = "0.7.3";
  };
  bootsnap = {
    dependencies = ["msgpack"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "17m8wl117khkz6xmrc4v5cmqvy021gcvz76apwlbyrpahg9hm2yq";
      type = "gem";
    };
    version = "1.1.5";
  };
  brakeman = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1yqdz3lk7zajyr3hkf2nmipw6g3m72ri41gyac0m4m96kj76ygfr";
      type = "gem";
    };
    version = "4.0.1";
  };
  browser = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1xxdpm4xc0xf4w6nqmzr2ms77y8lcrs6l6l4ga220d49mbls3rnl";
      type = "gem";
    };
    version = "2.5.2";
  };
  builder = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0qibi5s67lpdv1wgcj66wcymcr04q6j4mzws6a479n0mlrmh5wr1";
      type = "gem";
    };
    version = "3.2.3";
  };
  bullet = {
    dependencies = ["activesupport" "uniform_notifier"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0cfrawk2gag0b2ya03dzbb0vs7hipq7xa5l4qiz6c4v0cqxy8mp6";
      type = "gem";
    };
    version = "5.6.1";
  };
  bundler-audit = {
    dependencies = ["thor"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1b884xja6q87siscsx34z2ky3h7npd334pprfy13ns60fax8pn52";
      type = "gem";
    };
    version = "0.6.0";
  };
  capistrano = {
    dependencies = ["airbrussh" "i18n" "rake" "sshkit"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1i2ria8a1v54ns32y5chgs6vcz2ycnnsa77crksm0vz1ikvmmh70";
      type = "gem";
    };
    version = "3.10.0";
  };
  capistrano-bundler = {
    dependencies = ["capistrano" "sshkit"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1p00rw2886v77kfjnh0mslyrv4lij5fa9niflz1lhynzlivgrmdr";
      type = "gem";
    };
    version = "1.3.0";
  };
  capistrano-rails = {
    dependencies = ["capistrano" "capistrano-bundler"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "198a9b8plhb2pvnhdghhkfp7pkw4w9im9bysaqm9yd345fk7wcxd";
      type = "gem";
    };
    version = "1.3.1";
  };
  capistrano-rbenv = {
    dependencies = ["capistrano" "sshkit"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1jvip3ki8jm3qcl98czsq030zpijivwyhxcvk98ykipmygw1zn1y";
      type = "gem";
    };
    version = "2.1.3";
  };
  capistrano-yarn = {
    dependencies = ["capistrano"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1zdg2s061vl5b8114n909mrjb2hc1qx0i4wqx9nacsrcjgyp07l9";
      type = "gem";
    };
    version = "2.0.2";
  };
  capybara = {
    dependencies = ["addressable" "mini_mime" "nokogiri" "rack" "rack-test" "xpath"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0hkl6p07gf29952biv07fy88vjz46ng2h37wwx5ks0mk9kn8vvvf";
      type = "gem";
    };
    version = "2.16.1";
  };
  case_transform = {
    dependencies = ["activesupport"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0fzyws6spn5arqf6q604dh9mrj84a36k5hsc8z7jgcpfvhc49bg2";
      type = "gem";
    };
    version = "0.2";
  };
  charlock_holmes = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "09dn56sx0kcw0k8ypiynhnhhiq7ff9m7b57l8wvnxj82wxsjb54y";
      type = "gem";
    };
    version = "0.7.5";
  };
  chunky_png = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0j0dngz6s0j3s3zaf9vrimjz65s9k7ad1c3xmmldr1vmz8sbd843";
      type = "gem";
    };
    version = "1.3.8";
  };
  cld3 = {
    dependencies = ["ffi"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1psjk20j1fx1rfdgdkzycnwnqgsgybr63g4lylbmf665x44a6sca";
      type = "gem";
    };
    version = "3.2.1";
  };
  climate_control = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0q11v0iabvr6rif0d025xh078ili5frrihlj0m04zfg7lgvagxji";
      type = "gem";
    };
    version = "0.2.0";
  };
  cocaine = {
    dependencies = ["climate_control"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "01kk5xd7lspbkdvn6nyj0y51zhvia3z6r4nalbdcqw5fbsywwi7d";
      type = "gem";
    };
    version = "0.5.8";
  };
  coderay = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15vav4bhcc2x3jmi3izb11l4d9f3xv8hp2fszb7iqmpsccv1pz4y";
      type = "gem";
    };
    version = "1.1.2";
  };
  colorize = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "133rqj85n400qk6g3dhf2bmfws34mak1wqihvh3bgy9jhajw580b";
      type = "gem";
    };
    version = "0.8.1";
  };
  concurrent-ruby = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "183lszf5gx84kcpb779v6a2y0mx9sssy8dgppng1z9a505nj1qcf";
      type = "gem";
    };
    version = "1.0.5";
  };
  connection_pool = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "17vpaj6kyf2i8bimaxz7rg1kyadf4d10642ja67qiqlhwgczl2w7";
      type = "gem";
    };
    version = "2.2.1";
  };
  crack = {
    dependencies = ["safe_yaml"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0abb0fvgw00akyik1zxnq7yv391va148151qxdghnzngv66bl62k";
      type = "gem";
    };
    version = "0.4.3";
  };
  crass = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1czijxlagzpzwchr2ldrgfi7kywg08idjpq37ndcmwh4fmz72c4l";
      type = "gem";
    };
    version = "1.0.3";
  };
  debug_inspector = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0vxr0xa1mfbkfcrn71n7c4f2dj7la5hvphn904vh20j3x4j5lrx0";
      type = "gem";
    };
    version = "0.0.3";
  };
  devise = {
    dependencies = ["bcrypt" "orm_adapter" "railties" "responders" "warden"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0mb378fqk2fbsi44fam0syajdpfdn3b2rrh9zsm4p079aa13q8c6";
      type = "gem";
    };
    version = "4.3.0";
  };
  devise-two-factor = {
    dependencies = ["activesupport" "attr_encrypted" "devise" "railties" "rotp"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0vbxhvpyi3ixmia7hakrck65jqavyxj4z78qq3nqbb40bzblcqsc";
      type = "gem";
    };
    version = "3.0.2";
  };
  diff-lcs = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "18w22bjz424gzafv6nzv98h0aqkwz3d9xhm7cbr1wfbyas8zayza";
      type = "gem";
    };
    version = "1.3";
  };
  docile = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0m8j31whq7bm5ljgmsrlfkiqvacrw6iz9wq10r3gwrv5785y8gjx";
      type = "gem";
    };
    version = "1.1.5";
  };
  domain_name = {
    dependencies = ["unf"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "12hs8yijhak7p2hf1xkh98g0mnp5phq3mrrhywzaxpwz1gw5r3kf";
      type = "gem";
    };
    version = "0.5.20170404";
  };
  doorkeeper = {
    dependencies = ["railties"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0r5rfvjjnlf9cn97cdrfw260zkg785k4197xqidgb35445k62mah";
      type = "gem";
    };
    version = "4.2.6";
  };
  dotenv = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1pgzlvs0sswnqlgfm9gkz2hlhkc0zd3vnlp2vglb1wbgnx37pjjv";
      type = "gem";
    };
    version = "2.2.1";
  };
  dotenv-rails = {
    dependencies = ["dotenv" "railties"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1cci93p30y342wax65vsv9rg76cm392snrh8phjw6x363wl9z4ip";
      type = "gem";
    };
    version = "2.2.1";
  };
  easy_translate = {
    dependencies = ["json" "thread" "thread_safe"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1f427bi4azvwfryb29fxb83zqlzkihrmjnfa609dzadva9zrbfp8";
      type = "gem";
    };
    version = "0.5.0";
  };
  encryptor = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0s8rvfl0vn8w7k1sgkc234060jh468s3zd45xa64p1jdmfa3zwmb";
      type = "gem";
    };
    version = "3.0.0";
  };
  erubi = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1zkaqb8zv14azb2fa8w79d3mssdx86k9kg2m1bgc2k428y2zf8g9";
      type = "gem";
    };
    version = "1.7.0";
  };
  et-orbi = {
    dependencies = ["tzinfo"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "14zi3kg6k7am27c50ywwssywds9mydlx0qkmvcq2pda5k8hbram9";
      type = "gem";
    };
    version = "1.0.8";
  };
  excon = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0mnc9lqlzwqj5ayp0lh7impisqm55mdg3mw5q4gi9yjic5sidc40";
      type = "gem";
    };
    version = "0.59.0";
  };
  execjs = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1yz55sf2nd3l666ms6xr18sm2aggcvmb8qr3v53lr4rir32y1yp1";
      type = "gem";
    };
    version = "2.7.0";
  };
  fabrication = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0kmbr1gg6z57aacfwrkvpg6klvvvx06y7wfgvj6hdg8n2vhbv79y";
      type = "gem";
    };
    version = "2.18.0";
  };
  faker = {
    dependencies = ["i18n"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "13rpbdasl5pn2jr1ra0avpfk0z6wbr3g85wqx22aqhqsqzhmlgfq";
      type = "gem";
    };
    version = "1.8.4";
  };
  fast_blank = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "16s1ilyvwzmkcgmklbrn0c2pch5n02vf921njx0bld4crgdr6z56";
      type = "gem";
    };
    version = "1.0.0";
  };
  ffi = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "034f52xf7zcqgbvwbl20jwdyjwznvqnwpbaps9nk18v9lgb1dpx0";
      type = "gem";
    };
    version = "1.9.18";
  };
  fog-core = {
    dependencies = ["builder" "excon" "formatador"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "02449kh2x3zj9xxszm02vy8zpbsrykvjrg5gj3kqcy2yizy2bhp3";
      type = "gem";
    };
    version = "1.45.0";
  };
  fog-json = {
    dependencies = ["fog-core" "multi_json"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0advkkdjajkym77r3c0bg2rlahl2akj0vl4p5r273k2qmi16n00r";
      type = "gem";
    };
    version = "1.0.2";
  };
  fog-local = {
    dependencies = ["fog-core"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1s0lncldbiajzcc5c0gf2g72bkqlwdlxy2x8bxk0j9073x1c8z8z";
      type = "gem";
    };
    version = "0.4.0";
  };
  fog-openstack = {
    dependencies = ["fog-core" "fog-json" "ipaddress"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "164dr34fp7wq2waiin46kg8zf03y9q0zk6vsr18qki1xqf8c2crd";
      type = "gem";
    };
    version = "0.1.22";
  };
  formatador = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1gc26phrwlmlqrmz4bagq1wd5b7g64avpx0ghxr9xdxcvmlii0l0";
      type = "gem";
    };
    version = "0.2.5";
  };
  fuubar = {
    dependencies = ["rspec-core" "ruby-progressbar"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0jlv2wisgnim29h47shvqhipbz1wgndfdr7i6y5wcfag0z2660lv";
      type = "gem";
    };
    version = "2.2.0";
  };
  globalid = {
    dependencies = ["activesupport"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "02smrgdi11kziqi9zhnsy9i6yr2fnxrqlv3lllsvdjki3cd4is38";
      type = "gem";
    };
    version = "0.4.1";
  };
  goldfinger = {
    dependencies = ["addressable" "http" "nokogiri" "oj"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0km080w6314450sf1592zqs4c98xd04f8z1bkvpg85yhdzlqwxy8";
      type = "gem";
    };
    version = "2.0.1";
  };
  hamlit = {
    dependencies = ["temple" "thor" "tilt"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0r418wgkvinld4b7y4jp0ypxnphgj1as08navikp4nmqaf2b0dnm";
      type = "gem";
    };
    version = "2.8.5";
  };
  hamlit-rails = {
    dependencies = ["actionpack" "activesupport" "hamlit" "railties"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "14gzlp6w1j3b5fb4bhbjjh24skx031vnfc2shym9bkmq3r0p8dws";
      type = "gem";
    };
    version = "0.2.0";
  };
  hamster = {
    dependencies = ["concurrent-ruby"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1n1lsh96vnyc1pnzyd30f9prcsclmvmkdb3nm5aahnyizyiy6lar";
      type = "gem";
    };
    version = "3.0.0";
  };
  hashdiff = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0yj5l2rw8i8jc725hbcpc4wks0qlaaimr3dpaqamfjkjkxl0hjp9";
      type = "gem";
    };
    version = "0.3.7";
  };
  highline = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "01ib7jp85xjc4gh4jg0wyzllm46hwv8p0w1m4c75pbgi41fps50y";
      type = "gem";
    };
    version = "1.7.10";
  };
  hiredis = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "19fsmy0qv0spyv1jm0mp6c8pk08r1rilw5f778m4n7hbc1x01wnl";
      type = "gem";
    };
    version = "0.6.1";
  };
  hkdf = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "04fixg0a51n4vy0j6c1hvisa2yl33m3jrrpxpb5sq6j511vjriil";
      type = "gem";
    };
    version = "0.3.0";
  };
  htmlentities = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1nkklqsn8ir8wizzlakncfv42i32wc0w9hxp00hvdlgjr7376nhj";
      type = "gem";
    };
    version = "4.3.4";
  };
  http = {
    dependencies = ["addressable" "http-cookie" "http-form_data" "http_parser.rb"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1kcd9qp8vm1rkyp7gfh8j0dbl3zpi97vz2vbhpbcsdsa7l21a59r";
      type = "gem";
    };
    version = "2.2.2";
  };
  http-cookie = {
    dependencies = ["domain_name"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "004cgs4xg5n6byjs7qld0xhsjq3n6ydfh897myr2mibvh6fjc49g";
      type = "gem";
    };
    version = "1.0.3";
  };
  http-form_data = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0j8dwwbfpf8kc0lcsqcgy29lflszd1x4d7kc0f7227892m7r6y0m";
      type = "gem";
    };
    version = "1.0.3";
  };
  http_accept_language = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0d0nlfz9vm4jr1l6q0chx4rp2hrnrfbx3gadc1dz930lbbaz0hq0";
      type = "gem";
    };
    version = "2.1.1";
  };
  "http_parser.rb" = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15nidriy0v5yqfjsgsra51wmknxci2n2grliz78sf9pga3n0l7gi";
      type = "gem";
    };
    version = "0.6.0";
  };
  httplog = {
    dependencies = ["colorize" "rack"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1v2n33mk35ch4cm3bf6yqniw8f7p9bmdb6zv7i92qpnpwllzp709";
      type = "gem";
    };
    version = "0.99.7";
  };
  i18n = {
    dependencies = ["concurrent-ruby"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "032wbfixfpwa67c893x5sn02ab0928vfqfshcs02bwkkxpqy9x8s";
      type = "gem";
    };
    version = "0.9.1";
  };
  i18n-tasks = {
    dependencies = ["activesupport" "ast" "easy_translate" "erubi" "highline" "i18n" "parser" "rainbow" "terminal-table"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0zx5l6gvwws3y06gr745cqplr15p1kqdj80wfjzdhc2khqz9jldy";
      type = "gem";
    };
    version = "0.9.19";
  };
  idn-ruby = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "07vblcyk3g72sbq12xz7xj28snpxnh3sbcnxy8bglqbfqqhvmawr";
      type = "gem";
    };
    version = "0.1.0";
  };
  ipaddress = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1x86s0s11w202j6ka40jbmywkrx8fhq8xiy8mwvnkhllj57hqr45";
      type = "gem";
    };
    version = "0.8.3";
  };
  iso-639 = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "10k1gpkkbxbasgjzh4hd32ygxzjb5312rphipm46ryxkpx556zzz";
      type = "gem";
    };
    version = "0.2.8";
  };
  jmespath = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "07w8ipjg59qavijq59hl82zs74jf3jsp7vxl9q3a2d0wpv5akz3y";
      type = "gem";
    };
    version = "1.3.1";
  };
  json = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "01v6jjpvh3gnq6sgllpfqahlgxzj50ailwhj9b3cd20hi2dx0vxp";
      type = "gem";
    };
    version = "2.1.0";
  };
  json-ld = {
    dependencies = ["multi_json" "rdf"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1x3pkydjw74rlgjhwi4m6wdc4pgq3bfzg5nfbl6rnqfmsj5b02ka";
      type = "gem";
    };
    version = "2.1.7";
  };
  json-ld-preloaded = {
    dependencies = ["json-ld" "multi_json" "rdf"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "11vqrylzdjfwcqdnbh0s86xp0ipws13vbj5ihahl55xlh5ff43g7";
      type = "gem";
    };
    version = "2.2.2";
  };
  jsonapi-renderer = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "00ysmcv3nrccyimi334ida4axlfgir6cc2ryjxrf4xb97m1bfk5j";
      type = "gem";
    };
    version = "0.2.0";
  };
  jwt = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1w0kaqrbl71cq9sbnixc20x5lqah3hs2i93xmhlfdg2y3by7yzky";
      type = "gem";
    };
    version = "2.1.0";
  };
  kaminari = {
    dependencies = ["activesupport" "kaminari-actionview" "kaminari-activerecord" "kaminari-core"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1j27y5phifwpggspglmg8pmlf6n4jblxwziix9am42661c770jlm";
      type = "gem";
    };
    version = "1.1.1";
  };
  kaminari-actionview = {
    dependencies = ["actionview" "kaminari-core"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1386wshpy1ygbris0s7rv7lyzbs0v8dfqkzdwsrsgm9fd1ira640";
      type = "gem";
    };
    version = "1.1.1";
  };
  kaminari-activerecord = {
    dependencies = ["activerecord" "kaminari-core"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0q31ik5648xi2hpy61knnjd0m7rvs17i93gzwcbh3ccj1y24gv2x";
      type = "gem";
    };
    version = "1.1.1";
  };
  kaminari-core = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1cfjrhvidvgdwp9ffsm9d4c2s18k2zp3gnya3f41qb3fc6bc2q2w";
      type = "gem";
    };
    version = "1.1.1";
  };
  launchy = {
    dependencies = ["addressable"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "190lfbiy1vwxhbgn4nl4dcbzxvm049jwc158r2x7kq3g5khjrxa2";
      type = "gem";
    };
    version = "2.4.3";
  };
  letter_opener = {
    dependencies = ["launchy"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1pcrdbxvp2x5six8fqn8gf09bn9rd3jga76ds205yph5m8fsda21";
      type = "gem";
    };
    version = "1.4.1";
  };
  letter_opener_web = {
    dependencies = ["actionmailer" "letter_opener" "railties"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1b4br7baj891h64qh2zxiz83qpgqaxkdrakq1n7zmhkjybhf5987";
      type = "gem";
    };
    version = "1.3.1";
  };
  link_header = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1yamrdq4rywmnpdhbygnkkl9fdy249fg5r851nrkkxr97gj5rihm";
      type = "gem";
    };
    version = "0.0.8";
  };
  lograge = {
    dependencies = ["actionpack" "activesupport" "railties" "request_store"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0diknkznj1a2218ihbx9gbbzcc75chrd7qh7sc62yn63qvx929p9";
      type = "gem";
    };
    version = "0.7.1";
  };
  loofah = {
    dependencies = ["crass" "nokogiri"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0672aifc9rshw2fpfwca07pz8wizb707a1w1aaxmb6irnjhrbzac";
      type = "gem";
    };
    version = "2.1.1";
  };
  mail = {
    dependencies = ["mini_mime"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "10dyifazss9mgdzdv08p47p344wmphp5pkh5i73s7c04ra8y6ahz";
      type = "gem";
    };
    version = "2.7.0";
  };
  mario-redis-lock = {
    dependencies = ["redis"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0wmcvm6xi4n96b30rv1dfv6cyxi5vbkz0i3w6dfbz2cawmsl6a3i";
      type = "gem";
    };
    version = "1.2.0";
  };
  method_source = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0xqj21j3vfq4ldia6i2akhn2qd84m0iqcnsl49kfpq3xk6x0dzgn";
      type = "gem";
    };
    version = "0.9.0";
  };
  microformats = {
    dependencies = ["json" "nokogiri"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "14az36ax3n81fmwqjb5giixvxsnmxpnlfrsz012pl78x1bkrvfki";
      type = "gem";
    };
    version = "4.0.7";
  };
  mime-types = {
    dependencies = ["mime-types-data"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0087z9kbnlqhci7fxh9f6il63hj1k02icq2rs0c6cppmqchr753m";
      type = "gem";
    };
    version = "3.1";
  };
  mime-types-data = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "04my3746hwa4yvbx1ranhfaqkgf6vavi1kyijjnw8w3dy37vqhkm";
      type = "gem";
    };
    version = "3.2016.0521";
  };
  mimemagic = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "00ibc1mhvdfyfyl103xwb45621nwyqxf124cni5hyfhag0fn1c3q";
      type = "gem";
    };
    version = "0.3.2";
  };
  mini_mime = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1lwhlvjqaqfm6k3ms4v29sby9y7m518ylsqz2j74i740715yl5c8";
      type = "gem";
    };
    version = "1.0.0";
  };
  mini_portile2 = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "13d32jjadpjj6d2wdhkfpsmy68zjx90p49bgf8f7nkpz86r1fr11";
      type = "gem";
    };
    version = "2.3.0";
  };
  minitest = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "05521clw19lrksqgvg2kmm025pvdhdaniix52vmbychrn2jm7kz2";
      type = "gem";
    };
    version = "5.10.3";
  };
  msgpack = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ck7w17d6b4jbb8inh1q57bghi9cjkiaxql1d3glmj1yavbpmlh7";
      type = "gem";
    };
    version = "1.1.0";
  };
  multi_json = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1raim9ddjh672m32psaa9niw67ywzjbxbdb8iijx3wv9k5b0pk2x";
      type = "gem";
    };
    version = "1.12.2";
  };
  net-scp = {
    dependencies = ["net-ssh"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0b0jqrcsp4bbi4n4mzyf70cp2ysyp6x07j8k8cqgxnvb4i3a134j";
      type = "gem";
    };
    version = "1.2.1";
  };
  net-ssh = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "07c4v97zl1daabmri9zlbzs6yvkl56z1q14bw74d53jdj0c17nhx";
      type = "gem";
    };
    version = "4.2.0";
  };
  nio4r = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1n7csawahihc4z0d1888l2c9hlxxd06m093c58gkp1mcbj9bvyb0";
      type = "gem";
    };
    version = "2.1.0";
  };
  nokogiri = {
    dependencies = ["mini_portile2"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "105xh2zkr8nsyfaj2izaisarpnkrrl9000y3nyflg9cbzrfxv021";
      type = "gem";
    };
    version = "1.8.1";
  };
  nokogumbo = {
    dependencies = ["nokogiri"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0qgzc5nljajg9kyc8xv3fiwfgx5c9h5fv3hq2bpkmjz75dndq0z0";
      type = "gem";
    };
    version = "1.4.13";
  };
  nsa = {
    dependencies = ["activesupport" "concurrent-ruby" "sidekiq" "statsd-ruby"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1xki3jd107lc189mwwyxf19wz17dlaysrqy2jcbgyk7cdvbmhgf0";
      type = "gem";
    };
    version = "0.2.4";
  };
  oj = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0mwynvq2aw6dgz86gxc62dyh2w615h5icjmfd8nbckks8kq7i1d2";
      type = "gem";
    };
    version = "3.3.9";
  };
  orm_adapter = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1fg9jpjlzf5y49qs9mlpdrgs5rpcyihq1s4k79nv9js0spjhnpda";
      type = "gem";
    };
    version = "0.5.0";
  };
  ostatus2 = {
    dependencies = ["addressable" "http" "nokogiri"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "18sxr763p8cb743r9z2gfl9nbmm38yy4gxbc9afwnhbp8ax9gb1y";
      type = "gem";
    };
    version = "2.0.2";
  };
  ox = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0jb0qjzdqz3hyavpaqchqzvvy0san264x6g8b9y949a2pa8dbm6k";
      type = "gem";
    };
    version = "2.8.2";
  };
  paperclip = {
    dependencies = ["activemodel" "activesupport" "cocaine" "mime-types" "mimemagic"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1x71pssfxv2lsclspf45isggdpmvsjpfyz6rdrx0fzzhlgqa3zdi";
      type = "gem";
    };
    version = "5.1.0";
  };
  paperclip-av-transcoder = {
    dependencies = ["av" "paperclip"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1gcnp3fpdb5lqilcij4yqga6397nb7zyyf9lzxnqpbp7cvc18lhf";
      type = "gem";
    };
    version = "0.6.4";
  };
  parallel = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0qv2yj4sxr36ga6xdxvbq9h05hn10bwcbkqv6j6q1fiixhsdnnzd";
      type = "gem";
    };
    version = "1.12.0";
  };
  parallel_tests = {
    dependencies = ["parallel"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "079c9jwmqa0gbclaarra0qs4ab5gag0i6rv77cnl5i6db8lq0y5q";
      type = "gem";
    };
    version = "2.19.0";
  };
  parser = {
    dependencies = ["ast"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0bqc29xx4zwlshvi6krrd0sl82d7xjfhcrxvgf38wvdqcl3b7ck3";
      type = "gem";
    };
    version = "2.4.0.2";
  };
  pg = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "00vhasqwc4f98qb4wxqn2h07fjwzhp5lwyi41j2gndi2g02wrdqh";
      type = "gem";
    };
    version = "0.21.0";
  };
  pghero = {
    dependencies = ["activerecord"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1wxdq0pgrnc62f6lhzvrxk71f5n6mysk6cvaxn0acg9qgndb8wsj";
      type = "gem";
    };
    version = "1.7.0";
  };
  pkg-config = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "056qb6cwbw2l9riq376wazx4kwd67cdilyclpa6j38mfsswpmzws";
      type = "gem";
    };
    version = "1.2.8";
  };
  powerpack = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1fnn3fli5wkzyjl4ryh0k90316shqjfnhydmc7f8lqpi0q21va43";
      type = "gem";
    };
    version = "0.1.1";
  };
  pry = {
    dependencies = ["coderay" "method_source"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1mh312k3y94sj0pi160wpia0ps8f4kmzvm505i6bvwynfdh7v30g";
      type = "gem";
    };
    version = "0.11.3";
  };
  pry-rails = {
    dependencies = ["pry"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0k2d43bwmqbswfra4fkadjjbszwb11pr7qdkma91qrcrk62wqxvy";
      type = "gem";
    };
    version = "0.3.6";
  };
  public_suffix = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0mvzd9ycjw8ydb9qy3daq3kdzqs2vpqvac4dqss6ckk4rfcjc637";
      type = "gem";
    };
    version = "3.0.1";
  };
  puma = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0h4jzxx8nxlls2ccjkd0zw9k68wxqplx1fq78kkpi2p45c6jphsk";
      type = "gem";
    };
    version = "3.11.0";
  };
  pundit = {
    dependencies = ["activesupport"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "10d7k6zgxqzp1mq3mj6z1dna8qd3m9wxknlyfpswxr8p1ggy4f5x";
      type = "gem";
    };
    version = "1.1.0";
  };
  rack = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1kczgp2zwcrvp257dl8j4y3mnyqflxr7rn4vl9w1rwblznx9n74c";
      type = "gem";
    };
    version = "2.0.3";
  };
  rack-attack = {
    dependencies = ["rack"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1r1phk0anxfn9fy3izba3j53g0f6b4jvnrp8xkccfm62pqwgz352";
      type = "gem";
    };
    version = "5.0.1";
  };
  rack-cors = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0lcm0zw1q0c0fivdc0wldgkbr069p7p8b02if0ib5y4l0mnfaw29";
      type = "gem";
    };
    version = "0.4.1";
  };
  rack-protection = {
    dependencies = ["rack"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "04dad1ij5lgjp2pk8ykpxxx2081krmlbh8gii5ip7zpwnc6g2x2m";
      type = "gem";
    };
    version = "2.0.0";
  };
  rack-proxy = {
    dependencies = ["rack"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1lc7d1q43y3m6r52jggv1s2vlz863dbrn54blpfqzpszlw9dmsk5";
      type = "gem";
    };
    version = "0.6.2";
  };
  rack-test = {
    dependencies = ["rack"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gv8sb6bxp6anqvqr53w10hs4xj8i39c0jajd0qd03lvjadgc926";
      type = "gem";
    };
    version = "0.8.2";
  };
  rack-timeout = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0lx1l8zxspqqhbcj6lxxbkkxfrsahphs0dgq4jq05iwlhyx8n9mn";
      type = "gem";
    };
    version = "0.4.2";
  };
  rails = {
    dependencies = ["actioncable" "actionmailer" "actionpack" "actionview" "activejob" "activemodel" "activerecord" "activesupport" "railties" "sprockets-rails"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1f4qdznh7cqc4233hwg61qhpj2mwz1m4g2djwzjqk1v78lh1khjw";
      type = "gem";
    };
    version = "5.1.4";
  };
  rails-controller-testing = {
    dependencies = ["actionpack" "actionview" "activesupport"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "16kdkk73mhhs73iz3i1i0ryjm84dadiyh817b3nh8acdi490jyhy";
      type = "gem";
    };
    version = "1.0.2";
  };
  rails-dom-testing = {
    dependencies = ["activesupport" "nokogiri"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1lfq2a7kp2x64dzzi5p4cjcbiv62vxh9lyqk2f0rqq3fkzrw8h5i";
      type = "gem";
    };
    version = "2.0.3";
  };
  rails-html-sanitizer = {
    dependencies = ["loofah"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "138fd86kv073zqfx0xifm646w6bgw2lr8snk16lknrrfrss8xnm7";
      type = "gem";
    };
    version = "1.0.3";
  };
  rails-i18n = {
    dependencies = ["i18n" "railties"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0389gbibn2shalwfan9q8qd93cdvxqiycafq9hzg7diz0inlzv78";
      type = "gem";
    };
    version = "5.0.4";
  };
  rails-settings-cached = {
    dependencies = ["rails"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0wyhyls0aqb1iw7mnaldg39w3mnbi3anmpbvb52rjwkpj2mchhnc";
      type = "gem";
    };
    version = "0.6.6";
  };
  railties = {
    dependencies = ["actionpack" "activesupport" "method_source" "rake" "thor"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "00c0laqxcsa243nv7dzln4x9vyxwvv63lg53b15n63w1nhrg6xz4";
      type = "gem";
    };
    version = "5.1.4";
  };
  rainbow = {
    dependencies = ["rake"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "08w2ghc5nv0kcq5b257h7dwjzjz1pqcavajfdx2xjyxqsvh2y34w";
      type = "gem";
    };
    version = "2.2.2";
  };
  rake = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "190p7cs8zdn07mjj6xwwsdna3g0r98zs4crz7jh2j2q5b0nbxgjf";
      type = "gem";
    };
    version = "12.3.0";
  };
  rb-fsevent = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1fbpmjypwxkb8r7y1kmhmyp6gawa4byw0yb3jc3dn9ly4ld9lizf";
      type = "gem";
    };
    version = "0.10.2";
  };
  rb-inotify = {
    dependencies = ["ffi"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0yfsgw5n7pkpyky6a9wkf1g9jafxb0ja7gz0qw0y14fd2jnzfh71";
      type = "gem";
    };
    version = "0.9.10";
  };
  rdf = {
    dependencies = ["hamster" "link_header"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15ibg0wxj1hq64w8isbpagv216xspgj8w0g1khcywh1gc2wzijs4";
      type = "gem";
    };
    version = "2.2.12";
  };
  rdf-normalize = {
    dependencies = ["rdf"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1266ng5sb44zcn8mb69kzf5nm9jcnjirbz954xc8xzii6phqlpgk";
      type = "gem";
    };
    version = "0.3.2";
  };
  redis = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0i415x8gi0c5vsiy6ikvx5js6fhc4x80a5lqv8iidy2iymd20irv";
      type = "gem";
    };
    version = "3.3.5";
  };
  redis-actionpack = {
    dependencies = ["actionpack" "redis-rack" "redis-store"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15k41gz7nygd4yydk2yd25gghya1j7q6zifk4mdrra6bwnwjbm63";
      type = "gem";
    };
    version = "5.0.2";
  };
  redis-activesupport = {
    dependencies = ["activesupport" "redis-store"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0rq5dhrzc1l8c7f5gx9r7mvnsk5206dfwih3yv5si5rf42nx2ay5";
      type = "gem";
    };
    version = "5.0.4";
  };
  redis-namespace = {
    dependencies = ["redis"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0r7daagrjjribn098dxwbv9zivrbq2rsffbkj2ccxyn9lmjjbgah";
      type = "gem";
    };
    version = "1.6.0";
  };
  redis-rack = {
    dependencies = ["rack" "redis-store"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ykmhq63nx3fpk16mxj9dl1z3d08q7qs61m1nkrzy8z1xcmlapsh";
      type = "gem";
    };
    version = "2.0.3";
  };
  redis-rails = {
    dependencies = ["redis-actionpack" "redis-activesupport" "redis-store"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0hjvkyaw5hgz7v6fgwdk8pb966z44h1gv8jarmb0gwhkqmjnsh40";
      type = "gem";
    };
    version = "5.0.2";
  };
  redis-store = {
    dependencies = ["redis"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "00yh8rhv91vxjlqs4ylic99m9npjxmgib2vjj8hgzk1174y6vcmq";
      type = "gem";
    };
    version = "1.4.1";
  };
  request_store = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "18zzkrk0jzdbg08b1pppihs1f4v96l0kqlxc2bzjh11d8gbiifm7";
      type = "gem";
    };
    version = "1.3.2";
  };
  responders = {
    dependencies = ["actionpack" "railties"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1rhdyyvvm26f2l3fgwdp6xasfl2y0whwgy766bhdwz697mf78zfn";
      type = "gem";
    };
    version = "2.4.0";
  };
  rotp = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1w8d6svhq3y9y952r8cqirxvdx12zlkb7zxjb44bcbidb2sisy4d";
      type = "gem";
    };
    version = "2.1.2";
  };
  rqrcode = {
    dependencies = ["chunky_png"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0h1pnnydgs032psakvg3l779w3ghbn08ajhhhw19hpmnfhrs8k0a";
      type = "gem";
    };
    version = "0.10.1";
  };
  rspec-core = {
    dependencies = ["rspec-support"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15c4mgivvs9hpi0i1a8gypdl1f0hg6xknsbizgpm3khc95lqd9r9";
      type = "gem";
    };
    version = "3.7.0";
  };
  rspec-expectations = {
    dependencies = ["diff-lcs" "rspec-support"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1fw06wm8jdj8k7wrb8xmzj0fr1wjyb0ya13x31hidnyblm41hmvy";
      type = "gem";
    };
    version = "3.7.0";
  };
  rspec-mocks = {
    dependencies = ["diff-lcs" "rspec-support"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0b02ya3qhqgmcywqv4570dlhav70r656f7dmvwg89whpkq1z1xr3";
      type = "gem";
    };
    version = "3.7.0";
  };
  rspec-rails = {
    dependencies = ["actionpack" "activesupport" "railties" "rspec-core" "rspec-expectations" "rspec-mocks" "rspec-support"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0cdcnbv5dppwy3b4jdp5a0wd9m07a8wlqwb9yazn8i7k1k2mwgvx";
      type = "gem";
    };
    version = "3.7.2";
  };
  rspec-sidekiq = {
    dependencies = ["rspec-core" "sidekiq"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0y7pbqrbc8rjszc45vg4vz9qbn8aymgcc4ribrhvm76wrfz3ksfq";
      type = "gem";
    };
    version = "3.0.3";
  };
  rspec-support = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0hvpqpkh7j5rbwkkc0qwicwpgn0xlnpq935ikmx8n1wxxf553v3p";
      type = "gem";
    };
    version = "3.7.0";
  };
  rubocop = {
    dependencies = ["parallel" "parser" "powerpack" "rainbow" "ruby-progressbar" "unicode-display_width"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0cy2plq67b47ql06ypx3svbnnjmr2q616scwyhfd6330cg0aacf1";
      type = "gem";
    };
    version = "0.51.0";
  };
  ruby-oembed = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1kw4aplb3m13z3kchhb79wf87qb3prn1m99s6vl5cyp0xqwyymv0";
      type = "gem";
    };
    version = "0.12.0";
  };
  ruby-progressbar = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1igh1xivf5h5g3y5m9b4i4j2mhz2r43kngh4ww3q1r80ch21nbfk";
      type = "gem";
    };
    version = "1.9.0";
  };
  rufus-scheduler = {
    dependencies = ["et-orbi"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "07xcdm0wvkvn19hd8x76fwcjm8f711lg5ax90q38clkdnlssv8mw";
      type = "gem";
    };
    version = "3.4.2";
  };
  safe_yaml = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1hly915584hyi9q9vgd968x2nsi5yag9jyf5kq60lwzi5scr7094";
      type = "gem";
    };
    version = "1.0.4";
  };
  sanitize = {
    dependencies = ["crass" "nokogiri" "nokogumbo"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1by4shqpigrxs8s5n178xwah730vg5qy1gwqz91kclkmdrpnwv8k";
      type = "gem";
    };
    version = "4.5.0";
  };
  sass = {
    dependencies = ["sass-listen"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1167camc4ccqf9lcjlpyf96ji00f0041i7xanj2nm41fkx7kr7kr";
      type = "gem";
    };
    version = "3.5.3";
  };
  sass-listen = {
    dependencies = ["rb-fsevent" "rb-inotify"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0xw3q46cmahkgyldid5hwyiwacp590zj2vmswlll68ryvmvcp7df";
      type = "gem";
    };
    version = "4.0.0";
  };
  scss_lint = {
    dependencies = ["rake" "sass"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "01bfkrjn1i0hfg1ifwn1rs7vqwdbdw158krwr5fm6iasd9zgl10g";
      type = "gem";
    };
    version = "0.56.0";
  };
  sidekiq = {
    dependencies = ["concurrent-ruby" "connection_pool" "rack-protection" "redis"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0mmmv6k4l5rd74zw4xmwsadi0pbbcyzk1cm73zd8fzwra6nfz7sh";
      type = "gem";
    };
    version = "5.0.5";
  };
  sidekiq-bulk = {
    dependencies = ["activesupport" "sidekiq"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1yj2fwjygv93pr6ph5xyapgwq5vhspvg2hkv8mgf3d3ain082wbi";
      type = "gem";
    };
    version = "0.1.1";
  };
  sidekiq-scheduler = {
    dependencies = ["redis" "rufus-scheduler" "sidekiq" "tilt"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0sy1a2mfjzqd9vkabyj441v9va169s14iqy88q1d1b5bdf1bnpq6";
      type = "gem";
    };
    version = "2.1.10";
  };
  sidekiq-unique-jobs = {
    dependencies = ["sidekiq" "thor"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "001bmbqbibf7r3hbdkm2sjnmdw5dznnwk89f2s7wk0xhibsczkhw";
      type = "gem";
    };
    version = "5.0.10";
  };
  simple-navigation = {
    dependencies = ["activesupport"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "08a2s18an3br3xj5j86r33q0hrkai0y157xg67h1khdskb08yylk";
      type = "gem";
    };
    version = "4.0.5";
  };
  simple_form = {
    dependencies = ["actionpack" "activemodel"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "00xzsvxkz8x7fjyvib1s2v6y9w579hryxyb5h88m7d1glg13va87";
      type = "gem";
    };
    version = "3.5.0";
  };
  simplecov = {
    dependencies = ["docile" "json" "simplecov-html"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0zzl7kykpgrs0srn16yglwyyr5d3f7vz0zcb2f5lgd9kkb4d40dj";
      type = "gem";
    };
    version = "0.15.1";
  };
  simplecov-html = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1lihraa4rgxk8wbfl77fy9sf0ypk31iivly8vl3w04srd7i0clzn";
      type = "gem";
    };
    version = "0.10.2";
  };
  sprockets = {
    dependencies = ["concurrent-ruby" "rack"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0sv3zk5hwxyjvg7iy9sggjc7k3mfxxif7w8p260rharfyib939ar";
      type = "gem";
    };
    version = "3.7.1";
  };
  sprockets-rails = {
    dependencies = ["actionpack" "activesupport" "sprockets"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ab42pm8p5zxpv3sfraq45b9lj39cz9mrpdirm30vywzrwwkm5p1";
      type = "gem";
    };
    version = "3.2.1";
  };
  sshkit = {
    dependencies = ["net-scp" "net-ssh"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "13d6axm9zxg84cycz4r808glsnmx5zvrl70jvwn08dn2rfq8pzbd";
      type = "gem";
    };
    version = "1.15.1";
  };
  statsd-ruby = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1qh9w1vydx96v5y04y0k2g56k9yrsgrmbxh1d7haq07wbli0a6yz";
      type = "gem";
    };
    version = "1.2.1";
  };
  strong_migrations = {
    dependencies = ["activerecord"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0zzw7gjd0jfxd5sil3zp6xz09zr9azl2mmas2bsfmn500d4fkb9a";
      type = "gem";
    };
    version = "0.1.9";
  };
  temple = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "00nxf610nzi4n1i2lkby43nrnarvl89fcl6lg19406msr0k3ycmq";
      type = "gem";
    };
    version = "0.8.0";
  };
  terminal-table = {
    dependencies = ["unicode-display_width"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1512cngw35hsmhvw4c05rscihc59mnj09m249sm9p3pik831ydqk";
      type = "gem";
    };
    version = "1.8.0";
  };
  thor = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0nmqpyj642sk4g16nkbq6pj856adpv91lp4krwhqkh2iw63aszdl";
      type = "gem";
    };
    version = "0.20.0";
  };
  thread = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1xbnfzcxyswi2pz57vmj8yq7pp1g52cqwbpxj28drm3q13909xqf";
      type = "gem";
    };
    version = "0.2.2";
  };
  thread_safe = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0nmhcgq6cgz44srylra07bmaw99f5271l0dpsvl5f75m44l0gmwy";
      type = "gem";
    };
    version = "0.3.6";
  };
  tilt = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0020mrgdf11q23hm1ddd6fv691l51vi10af00f137ilcdb2ycfra";
      type = "gem";
    };
    version = "2.0.8";
  };
  twitter-text = {
    dependencies = ["unf"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1732h7hy1k152w8wfvjsx7b79alk45i5imwd37ia4qcx8hfm3gvg";
      type = "gem";
    };
    version = "1.14.7";
  };
  tzinfo = {
    dependencies = ["thread_safe"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "09dpbrih054mn42flbbcdpzk2727mzfvjrgqb12zdafhx7p9rrzp";
      type = "gem";
    };
    version = "1.2.4";
  };
  tzinfo-data = {
    dependencies = ["tzinfo"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ajgpkrkymwmdqw4zrgxc660g1799gjh9llmdgh1sxpar0n61g5y";
      type = "gem";
    };
    version = "1.2017.3";
  };
  uglifier = {
    dependencies = ["execjs"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0wmqvn4xncw6h3d5gp2a44170zwxfyj3iq4rsjp16zarvzbdmgnz";
      type = "gem";
    };
    version = "3.2.0";
  };
  unf = {
    dependencies = ["unf_ext"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0bh2cf73i2ffh4fcpdn9ir4mhq8zi50ik0zqa1braahzadx536a9";
      type = "gem";
    };
    version = "0.1.4";
  };
  unf_ext = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "14hr2dzqh33kqc0xchs8l05pf3kjcayvad4z1ip5rdjxrkfk8glb";
      type = "gem";
    };
    version = "0.0.7.4";
  };
  unicode-display_width = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "12pi0gwqdnbx1lv5136v3vyr0img9wr0kxcn4wn54ipq4y41zxq8";
      type = "gem";
    };
    version = "1.3.0";
  };
  uniform_notifier = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1jha0l7x602g5rvah960xl9r0f3q25gslj39i0x1vai8i5z6zr1l";
      type = "gem";
    };
    version = "1.10.0";
  };
  warden = {
    dependencies = ["rack"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0va966lhpylcwbqb9n151kkihx30agh0a57mwjwdxyanll4s1q12";
      type = "gem";
    };
    version = "1.2.7";
  };
  webmock = {
    dependencies = ["addressable" "crack" "hashdiff"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0fndrv2gz5fkfnpjp794xylshq1ljhrvfh4x7srvcmyz7w4zmh2m";
      type = "gem";
    };
    version = "3.1.1";
  };
  webpacker = {
    dependencies = ["activesupport" "rack-proxy" "railties"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1gk6fmcxm4frqb8rs3csq0642jpfp41flyp4swzxi250dy9y2n8g";
      type = "gem";
    };
    version = "3.0.2";
  };
  webpush = {
    dependencies = ["hkdf" "jwt"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0mxxf6jlngyscfgkgl6r9bj7m7c7q2abkaqrfp7z8kwvv87222ni";
      type = "gem";
    };
    version = "0.3.3";
  };
  websocket-driver = {
    dependencies = ["websocket-extensions"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1943442yllhldh9dbp374x2q39cxa49xrm28nb78b7mfbv3y195l";
      type = "gem";
    };
    version = "0.6.5";
  };
  websocket-extensions = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "034sdr7fd34yag5l6y156rkbhiqgmy395m231dwhlpcswhs6d270";
      type = "gem";
    };
    version = "0.1.3";
  };
  xpath = {
    dependencies = ["nokogiri"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ha626m6fh50fpilb9pdnmq9xl586w7c0zyidg895c3iq13rqgyw";
      type = "gem";
    };
    version = "2.1.0";
  };
}