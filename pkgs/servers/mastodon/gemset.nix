{
  actioncable = {
    dependencies = ["actionpack" "nio4r" "websocket-driver"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "17vdxn0afi5rfnbs09nl0m0cyj7yvpi445bmi8pkmzbaqzqkq3ff";
      type = "gem";
    };
    version = "5.2.1";
  };
  actionmailer = {
    dependencies = ["actionpack" "actionview" "activejob" "mail" "rails-dom-testing"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0h1nqg47jap0wzp0dhlnck4xjijfvdfw49aipjp8y2ihdpvyqrx6";
      type = "gem";
    };
    version = "5.2.1";
  };
  actionpack = {
    dependencies = ["actionview" "activesupport" "rack" "rack-test" "rails-dom-testing" "rails-html-sanitizer"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "19zv9ix9iwpd8dxi5hyxgwrc1gh0fvx0a2vjhmic8dn8six41f4f";
      type = "gem";
    };
    version = "5.2.1";
  };
  actionview = {
    dependencies = ["activesupport" "builder" "erubi" "rails-dom-testing" "rails-html-sanitizer"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0dxanjs7ngpny4ig7dg93ywmg9ljswzg8risdlff6ag8fzvsnidf";
      type = "gem";
    };
    version = "5.2.1";
  };
  active_model_serializers = {
    dependencies = ["actionpack" "activemodel" "case_transform" "jsonapi-renderer"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "06arlz90rspfz899g3y2mrp5vwv6h6yahp936yqvl83d6jjpry12";
      type = "gem";
    };
    version = "0.10.7";
  };
  active_record_query_trace = {
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1aharmy1fcd0plv9k0i2dk5icvnlww8n43ia8xahfkcask0cpidh";
      type = "gem";
    };
    version = "1.5.4";
  };
  activejob = {
    dependencies = ["activesupport" "globalid"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1m4l7z08cx1lybfswfggy7y1rxnwr6gi15h0g9kkkkvmmn6klf3r";
      type = "gem";
    };
    version = "5.2.1";
  };
  activemodel = {
    dependencies = ["activesupport"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "043nnxaf3cfq8jijls0jh1bg3a8v5zd9slc62zc2acp2n2wkjnd4";
      type = "gem";
    };
    version = "5.2.1";
  };
  activerecord = {
    dependencies = ["activemodel" "activesupport" "arel"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0pc7cycvhzjpw0swil2inka6c0fvcxhln793czp52pidg0654g7g";
      type = "gem";
    };
    version = "5.2.1";
  };
  activestorage = {
    dependencies = ["actionpack" "activerecord" "marcel"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0wncr3h94jsjmmqqmmips9vgy2kf1zhb96rlv5fbrgqplfhvpyag";
      type = "gem";
    };
    version = "5.2.1";
  };
  activesupport = {
    dependencies = ["concurrent-ruby" "i18n" "minitest" "tzinfo"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ziy6xk31k4fs115cdkba1ys4i8nzcyri7a2jig7nx7k5h7li6l2";
      type = "gem";
    };
    version = "5.2.1";
  };
  addressable = {
    dependencies = ["public_suffix"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0viqszpkggqi8hq87pqp0xykhvz60g99nwmkwsb0v45kc2liwxvk";
      type = "gem";
    };
    version = "2.5.2";
  };
  airbrussh = {
    dependencies = ["sshkit"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0yp1sl5n94ksxpwmaajflbdls45s81hw4spgz01h19xs2zrvv8wl";
      type = "gem";
    };
    version = "1.3.0";
  };
  annotate = {
    dependencies = ["activerecord" "rake"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1l69l2kn06nkrnyq6gb1x322x5raxs8ms60shpf0v5dsi8lfig16";
      type = "gem";
    };
    version = "2.7.4";
  };
  arel = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1jk7wlmkr61f6g36w9s2sn46nmdg6wn2jfssrhbhirv5x9n95nk0";
      type = "gem";
    };
    version = "9.0.0";
  };
  ast = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "184ssy3w93nkajlz2c70ifm79jp3j737294kbc5fjw69v1w0n9x7";
      type = "gem";
    };
    version = "2.4.0";
  };
  attr_encrypted = {
    dependencies = ["encryptor"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ncv2az1zlj33bsllr6q1qdvbw42gv91lxq0ryclbv8l8xh841jg";
      type = "gem";
    };
    version = "3.1.0";
  };
  av = {
    dependencies = ["cocaine"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1swakpybf6g0nzfdn6q4s9c97ysc3i4ffk84dw8v2321fpvc8gqq";
      type = "gem";
    };
    version = "0.9.0";
  };
  aws-eventstream = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gdiwkg24jpx5f3bkw6vchgliicn6v9bpm09j0dldaxsca66q0wy";
      type = "gem";
    };
    version = "1.0.1";
  };
  aws-partitions = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0hhdbb5fy8514v7gpz5n3csbhwlk1wwnj9xxc9fwzxiyzh4y0zr4";
      type = "gem";
    };
    version = "1.106.0";
  };
  aws-sdk-core = {
    dependencies = ["aws-eventstream" "aws-partitions" "aws-sigv4" "jmespath"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1gj98hbmzw2c2j8ri1hlrig17b7fsvzzf5jlpzbmmk9ic69hvh1p";
      type = "gem";
    };
    version = "3.35.0";
  };
  aws-sdk-kms = {
    dependencies = ["aws-sdk-core" "aws-sigv4"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0g13jv1s8hj1yv6qxa2rm0k3n5jzmamn3zk3c73276s3gixpp986";
      type = "gem";
    };
    version = "1.11.0";
  };
  aws-sdk-s3 = {
    dependencies = ["aws-sdk-core" "aws-sdk-kms" "aws-sigv4"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1q0bppa23knjnzys3zrbbhajdj0fl9qc23nlrk72cc96rh4caklj";
      type = "gem";
    };
    version = "1.23.0";
  };
  aws-sigv4 = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1hzndv113i6bgy2n72i5l3mwn8vjnb6hhjxfkpn9mm2p5ra77yk7";
      type = "gem";
    };
    version = "1.0.3";
  };
  bcrypt = {
    groups = ["default" "pam_authentication"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ysblqxkclmnhrd0kmb5mr8p38mbar633gdsb14b7dhkhgawgzfy";
      type = "gem";
    };
    version = "3.1.12";
  };
  benchmark-ips = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1w59c4qnwkjqwn7zyp9hshslbshna77vknmz43h0va5lxisd6ai2";
      type = "gem";
    };
    version = "2.7.2";
  };
  better_errors = {
    dependencies = ["coderay" "erubi" "rack"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1pqnxxsqqs7vnqvamk5bzs84dv584g9s0qaf2vqb1v2aj5dabcg7";
      type = "gem";
    };
    version = "2.5.0";
  };
  binding_of_caller = {
    dependencies = ["debug_inspector"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "05syqlks7463zsy1jdfbbdravdhj9hpj5pv2m74blqpv8bq4vv5g";
      type = "gem";
    };
    version = "0.8.0";
  };
  bootsnap = {
    dependencies = ["msgpack"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0g6r784lmjfhwi046w82phsk244byq9wkj1q3lddwxg9z559bmhy";
      type = "gem";
    };
    version = "1.3.2";
  };
  brakeman = {
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1y4i4vw7hawypvgg04s544fqx52ml67h9zxsaqm8w5hvxmb20wkh";
      type = "gem";
    };
    version = "4.3.1";
  };
  browser = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0sdx0ny34i6vqxdsc7sy9g0nafdbrw8kvvb5xh9m18x1bzpqk92f";
      type = "gem";
    };
    version = "2.5.3";
  };
  builder = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0qibi5s67lpdv1wgcj66wcymcr04q6j4mzws6a479n0mlrmh5wr1";
      type = "gem";
    };
    version = "3.2.3";
  };
  bullet = {
    dependencies = ["activesupport" "uniform_notifier"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1szq47fa3m1k3x9dj6gh2g6q5n36zdmw8yxl5g45pbxrg70iaga8";
      type = "gem";
    };
    version = "5.7.6";
  };
  bundler-audit = {
    dependencies = ["thor"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1b884xja6q87siscsx34z2ky3h7npd334pprfy13ns60fax8pn52";
      type = "gem";
    };
    version = "0.6.0";
  };
  byebug = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "10znc1hjv8n686hhpl08f3m2g6h08a4b83nxblqwy2kqamkxcqf8";
      type = "gem";
    };
    version = "10.0.2";
  };
  capistrano = {
    dependencies = ["airbrussh" "i18n" "rake" "sshkit"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1p1hj8hpmplxl41y6phsvkw2k8x3yxmkngs8yl8gkr7c1ma870p4";
      type = "gem";
    };
    version = "3.11.0";
  };
  capistrano-bundler = {
    dependencies = ["capistrano" "sshkit"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1p00rw2886v77kfjnh0mslyrv4lij5fa9niflz1lhynzlivgrmdr";
      type = "gem";
    };
    version = "1.3.0";
  };
  capistrano-rails = {
    dependencies = ["capistrano" "capistrano-bundler"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "19j82kiarrph1ilw2xfhfj62z0b53w0gph7613b21iccb2gn3dqy";
      type = "gem";
    };
    version = "1.4.0";
  };
  capistrano-rbenv = {
    dependencies = ["capistrano" "sshkit"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "182dmsliny87b74m9mxi7farmp03ycqh30yf58b2kcx7m2js2s92";
      type = "gem";
    };
    version = "2.1.4";
  };
  capistrano-yarn = {
    dependencies = ["capistrano"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1zdg2s061vl5b8114n909mrjb2hc1qx0i4wqx9nacsrcjgyp07l9";
      type = "gem";
    };
    version = "2.0.2";
  };
  capybara = {
    dependencies = ["addressable" "mini_mime" "nokogiri" "rack" "rack-test" "regexp_parser" "xpath"];
    groups = ["test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0mgx24j9aqcablkny997qm8f1w0cpqmgy6kscrmna1k6r18w8pva";
      type = "gem";
    };
    version = "3.10.0";
  };
  case_transform = {
    dependencies = ["activesupport"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0fzyws6spn5arqf6q604dh9mrj84a36k5hsc8z7jgcpfvhc49bg2";
      type = "gem";
    };
    version = "0.2";
  };
  charlock_holmes = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1nf1l31n10yaark2rrg5qzyzcx9w80681449s3j09qmnipsl8rl5";
      type = "gem";
    };
    version = "0.7.6";
  };
  chewy = {
    dependencies = ["activesupport" "elasticsearch" "elasticsearch-dsl"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0m1n98fww2is9v4h73qnxjzs0l9ixx2szby5rip26g9l7mjwmm7v";
      type = "gem";
    };
    version = "5.0.0";
  };
  chunky_png = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "05g2xli9wbjylkmblln3bhvjalziwb92q452q8ibjagmb853424w";
      type = "gem";
    };
    version = "1.3.10";
  };
  cld3 = {
    dependencies = ["ffi"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ij0i1c511hak7n588qpl0pczdyvin7bzm4g4p5drzbrvr4n1ln7";
      type = "gem";
    };
    version = "3.2.2";
  };
  climate_control = {
    groups = ["test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0q11v0iabvr6rif0d025xh078ili5frrihlj0m04zfg7lgvagxji";
      type = "gem";
    };
    version = "0.2.0";
  };
  cocaine = {
    dependencies = ["climate_control"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "01kk5xd7lspbkdvn6nyj0y51zhvia3z6r4nalbdcqw5fbsywwi7d";
      type = "gem";
    };
    version = "0.5.8";
  };
  coderay = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15vav4bhcc2x3jmi3izb11l4d9f3xv8hp2fszb7iqmpsccv1pz4y";
      type = "gem";
    };
    version = "1.1.2";
  };
  concurrent-ruby = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "183lszf5gx84kcpb779v6a2y0mx9sssy8dgppng1z9a505nj1qcf";
      type = "gem";
    };
    version = "1.0.5";
  };
  connection_pool = {
    groups = ["default" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0lflx29mlznf1hn0nihkgllzbj8xp5qasn8j7h838465pi399k68";
      type = "gem";
    };
    version = "2.2.2";
  };
  crack = {
    dependencies = ["safe_yaml"];
    groups = ["default" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0abb0fvgw00akyik1zxnq7yv391va148151qxdghnzngv66bl62k";
      type = "gem";
    };
    version = "0.4.3";
  };
  crass = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0bpxzy6gjw9ggjynlxschbfsgmx8lv3zw1azkjvnb8b9i895dqfi";
      type = "gem";
    };
    version = "1.0.4";
  };
  css_parser = {
    dependencies = ["addressable"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gwvf8mc8gnz4aizfijplv3594998h2j44ydakpzsdmkivs07v61";
      type = "gem";
    };
    version = "1.6.0";
  };
  debug_inspector = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0vxr0xa1mfbkfcrn71n7c4f2dj7la5hvphn904vh20j3x4j5lrx0";
      type = "gem";
    };
    version = "0.0.3";
  };
  derailed_benchmarks = {
    dependencies = ["benchmark-ips" "get_process_mem" "heapy" "memory_profiler" "rack" "rake" "thor"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1c9djg1r2w461h97zmmdsdgnsrxqm4qfyp7gry9qxbav9skrplb8";
      type = "gem";
    };
    version = "1.3.5";
  };
  devise = {
    dependencies = ["bcrypt" "orm_adapter" "railties" "responders" "warden"];
    groups = ["default" "pam_authentication"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1vs8nibl568ghm6a7hbw6xgcv8zbm4gykprcxpnzi7bz5d4gvcjx";
      type = "gem";
    };
    version = "4.5.0";
  };
  devise-two-factor = {
    dependencies = ["activesupport" "attr_encrypted" "devise" "railties" "rotp"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1b61s5y1ch205lgf3xv8hcvyi27ddd0d4qbbcpnnakhn2bx16lmc";
      type = "gem";
    };
    version = "3.0.3";
  };
  devise_pam_authenticatable2 = {
    dependencies = ["devise" "rpam2"];
    groups = ["pam_authentication"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "13ipl52pkhc6vxp8ca31viwv01237bi2bfk3b1fixq1x46nf87p2";
      type = "gem";
    };
    version = "9.2.0";
  };
  diff-lcs = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "18w22bjz424gzafv6nzv98h0aqkwz3d9xhm7cbr1wfbyas8zayza";
      type = "gem";
    };
    version = "1.3";
  };
  docile = {
    groups = ["default" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0yyh4lr03q2vafzsfqy1xax7vr8zn7mbddz3ax3vnlm5fg0px6pn";
      type = "gem";
    };
    version = "1.3.0";
  };
  domain_name = {
    dependencies = ["unf"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0abdlwb64ns7ssmiqhdwgl27ly40x2l27l8hs8hn0z4kb3zd2x3v";
      type = "gem";
    };
    version = "0.5.20180417";
  };
  doorkeeper = {
    dependencies = ["railties"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0488m6nwp31mxrhayj60gsb7jgyw1lzh73r2kldx00a9bw3634d4";
      type = "gem";
    };
    version = "5.0.2";
  };
  dotenv = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1va5y19f7l5jh53vz5vibz618lg8z93k5m2k70l25s9k46v2gfm3";
      type = "gem";
    };
    version = "2.5.0";
  };
  dotenv-rails = {
    dependencies = ["dotenv" "railties"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1vmk541bhb2mw0gfc1bg43jdilqspiggxzglnlr26rzsmvy2cgd2";
      type = "gem";
    };
    version = "2.5.0";
  };
  elasticsearch = {
    dependencies = ["elasticsearch-api" "elasticsearch-transport"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0a08ynvxz5clfm2ndqpgjrv4aiga9m2y1ab34s3qkihdfdzdzhj8";
      type = "gem";
    };
    version = "6.0.2";
  };
  elasticsearch-api = {
    dependencies = ["multi_json"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1vkahknqn85vvwr1gzh8jf3pvdial0c0d524icg8x06vibqgzd5h";
      type = "gem";
    };
    version = "6.0.2";
  };
  elasticsearch-dsl = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1mwn6hvkki560p7sfc841q15zzgldsk9lzm2mlvc2bra7x1yk2q8";
      type = "gem";
    };
    version = "0.1.5";
  };
  elasticsearch-transport = {
    dependencies = ["faraday" "multi_json"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gpwbw70qisx681j1bw8xq6shg5kdxmcdzg6425af0b5881jg7iy";
      type = "gem";
    };
    version = "6.0.2";
  };
  encryptor = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0s8rvfl0vn8w7k1sgkc234060jh468s3zd45xa64p1jdmfa3zwmb";
      type = "gem";
    };
    version = "3.0.0";
  };
  equatable = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1sjm9zjakyixyvsqziikdrsqfzis6j3fq23crgjkp6fwkfgndj7x";
      type = "gem";
    };
    version = "0.5.0";
  };
  erubi = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0bws86na9k565raiz0kk61yy5pxxp0fmwyzpibdwjkq0xzx8q6q1";
      type = "gem";
    };
    version = "1.7.1";
  };
  et-orbi = {
    dependencies = ["tzinfo"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0wk7i0bmsy46la8gcvbmdns0ni8lmdqas838phj97bdwykxw8m4b";
      type = "gem";
    };
    version = "1.1.6";
  };
  excon = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15l9w0938c19nxmrp09n75qpmm64k12xj69h47yvxzcxcpbgnkb2";
      type = "gem";
    };
    version = "0.62.0";
  };
  fabrication = {
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0an28kjand4mjbkmnwd9fmgq3y5vf717zpmiijavar3sxqj52zri";
      type = "gem";
    };
    version = "2.20.1";
  };
  faker = {
    dependencies = ["i18n"];
    groups = ["test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "01q7wrk5bl0c0qrvg2my3kl0mbfnj1jpd89mqm3fzy4ggbkdhh7i";
      type = "gem";
    };
    version = "1.9.1";
  };
  faraday = {
    dependencies = ["multipart-post"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1dv1vcxxyw4vy0r2diiml0r8zqk1csrksfxv8nkrw61xlf2daaaa";
      type = "gem";
    };
    version = "0.15.0";
  };
  fast_blank = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "16s1ilyvwzmkcgmklbrn0c2pch5n02vf921njx0bld4crgdr6z56";
      type = "gem";
    };
    version = "1.0.0";
  };
  fastimage = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0i7p9jgb9x1lxkhkwq8xlq7an5qbgdq6gsyrbs2xnf5ffa8yx1i2";
      type = "gem";
    };
    version = "2.1.4";
  };
  ffi = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0jpm2dis1j7zvvy3lg7axz9jml316zrn7s0j59vyq3qr127z0m7q";
      type = "gem";
    };
    version = "1.9.25";
  };
  fog-core = {
    dependencies = ["builder" "excon" "formatador" "mime-types"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1agd6xgzk0rxrsjdpn94v4hy89s0nm2cs4zg2p880w2dan9xgrak";
      type = "gem";
    };
    version = "2.1.0";
  };
  fog-json = {
    dependencies = ["fog-core" "multi_json"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1zj8llzc119zafbmfa4ai3z5s7c4vp9akfs0f9l2piyvcarmlkyx";
      type = "gem";
    };
    version = "1.2.0";
  };
  fog-openstack = {
    dependencies = ["fog-core" "fog-json" "ipaddress"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0aphjrvmchmqbyxqq82yj0qngyvkmwdci9iqs8722fi23bk83gdl";
      type = "gem";
    };
    version = "0.3.7";
  };
  formatador = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1gc26phrwlmlqrmz4bagq1wd5b7g64avpx0ghxr9xdxcvmlii0l0";
      type = "gem";
    };
    version = "0.2.5";
  };
  fugit = {
    dependencies = ["et-orbi" "raabro"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1szijawzdii668z5is9xi849399gy786951dx0l5r2z5mbfqvl9i";
      type = "gem";
    };
    version = "1.1.6";
  };
  fuubar = {
    dependencies = ["rspec-core" "ruby-progressbar"];
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1sqkr1nh49rlm86l3qyrgsdqavgqii4pnrjn7855z6dfavh3spxr";
      type = "gem";
    };
    version = "2.3.2";
  };
  get_process_mem = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0bfd9q1z133a0wh3l8g2imd2rdlbdhav0z41k147n8j40hgg8ygw";
      type = "gem";
    };
    version = "0.2.2";
  };
  globalid = {
    dependencies = ["activesupport"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "02smrgdi11kziqi9zhnsy9i6yr2fnxrqlv3lllsvdjki3cd4is38";
      type = "gem";
    };
    version = "0.4.1";
  };
  goldfinger = {
    dependencies = ["addressable" "http" "nokogiri" "oj"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0n142035jhyqwczi52zjr07c8kygp9b9f158miaby3z5hygzjyzh";
      type = "gem";
    };
    version = "2.1.0";
  };
  hamlit = {
    dependencies = ["temple" "thor" "tilt"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0hk338vkzmwszxdh0q02iw88rbr3bj3fd7fzn4psm8wy80zcgl9i";
      type = "gem";
    };
    version = "2.8.8";
  };
  hamlit-rails = {
    dependencies = ["actionpack" "activesupport" "hamlit" "railties"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "14gzlp6w1j3b5fb4bhbjjh24skx031vnfc2shym9bkmq3r0p8dws";
      type = "gem";
    };
    version = "0.2.0";
  };
  hamster = {
    dependencies = ["concurrent-ruby"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1n1lsh96vnyc1pnzyd30f9prcsclmvmkdb3nm5aahnyizyiy6lar";
      type = "gem";
    };
    version = "3.0.0";
  };
  hashdiff = {
    groups = ["default" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0yj5l2rw8i8jc725hbcpc4wks0qlaaimr3dpaqamfjkjkxl0hjp9";
      type = "gem";
    };
    version = "0.3.7";
  };
  hashie = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1hh5lybf8hm7d7xs4xm8hxvm8xqrs2flc8fnwkrclaj746izw6xb";
      type = "gem";
    };
    version = "3.5.7";
  };
  heapy = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1r9f38fpgjgaxskkwvsliijj6vfmgsff9pnranvvvzkdl67hk1hw";
      type = "gem";
    };
    version = "0.1.4";
  };
  highline = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "069sz5qmjpmv3x7kr5r3rwl20m9vqg97p15scmjdagglra34clkl";
      type = "gem";
    };
    version = "2.0.0";
  };
  hiredis = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "19fsmy0qv0spyv1jm0mp6c8pk08r1rilw5f778m4n7hbc1x01wnl";
      type = "gem";
    };
    version = "0.6.1";
  };
  hitimes = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1z1ss5j5xf9lpc0pn8vbhxkx63r6ai1dd453dqcms2638kx4l2b9";
      type = "gem";
    };
    version = "1.3.0";
  };
  hkdf = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "04fixg0a51n4vy0j6c1hvisa2yl33m3jrrpxpb5sq6j511vjriil";
      type = "gem";
    };
    version = "0.3.0";
  };
  htmlentities = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1nkklqsn8ir8wizzlakncfv42i32wc0w9hxp00hvdlgjr7376nhj";
      type = "gem";
    };
    version = "4.3.4";
  };
  http = {
    dependencies = ["addressable" "http-cookie" "http-form_data" "http_parser.rb"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1jlm5prw437wqpfxcigh88lfap3m7g8mnmj5as7qw6dzqnvrxwmc";
      type = "gem";
    };
    version = "3.3.0";
  };
  http-cookie = {
    dependencies = ["domain_name"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "004cgs4xg5n6byjs7qld0xhsjq3n6ydfh897myr2mibvh6fjc49g";
      type = "gem";
    };
    version = "1.0.3";
  };
  http-form_data = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15lpn604byf7cyxnw949xz4rvpcknqp7a48q73nm630gqxsa76f3";
      type = "gem";
    };
    version = "2.1.1";
  };
  http_accept_language = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0d0nlfz9vm4jr1l6q0chx4rp2hrnrfbx3gadc1dz930lbbaz0hq0";
      type = "gem";
    };
    version = "2.1.1";
  };
  "http_parser.rb" = {
    groups = ["default"];
    platforms = [];
    source = {
      fetchSubmodules = false;
      rev = "54b17ba8c7d8d20a16dfc65d1775241833219cf2";
      sha256 = "1kyfrq8d9rsycnwd9nmgcp77xhl47vsm7pg99vk3sa6rzh1qmj2d";
      type = "git";
      url = "https://github.com/tmm1/http_parser.rb";
    };
    version = "0.6.1";
  };
  httplog = {
    dependencies = ["rack" "rainbow"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1kxxvkk2zkvq5skj5m6j6z5v0zz404f1s5fi6s4p8ywx5g1hj4ff";
      type = "gem";
    };
    version = "1.1.1";
  };
  i18n = {
    dependencies = ["concurrent-ruby"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1gcp1m1p6dpasycfz2sj82ci9ggz7lsskz9c9q6gvfwxrl8y9dx7";
      type = "gem";
    };
    version = "1.1.1";
  };
  i18n-tasks = {
    dependencies = ["activesupport" "ast" "erubi" "highline" "i18n" "parser" "rails-i18n" "rainbow" "terminal-table"];
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "16592471ylgigmjx98pmbqibjwhavr4wb670kya9qh3nbgf7s1ym";
      type = "gem";
    };
    version = "0.9.28";
  };
  idn-ruby = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "07vblcyk3g72sbq12xz7xj28snpxnh3sbcnxy8bglqbfqqhvmawr";
      type = "gem";
    };
    version = "0.1.0";
  };
  ipaddress = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1x86s0s11w202j6ka40jbmywkrx8fhq8xiy8mwvnkhllj57hqr45";
      type = "gem";
    };
    version = "0.8.3";
  };
  iso-639 = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "10k1gpkkbxbasgjzh4hd32ygxzjb5312rphipm46ryxkpx556zzz";
      type = "gem";
    };
    version = "0.2.8";
  };
  jaro_winkler = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0rr797nqz081bfk30m2apj5h24bg5d1jr1c8p3xwx4hbwsrbclah";
      type = "gem";
    };
    version = "1.5.1";
  };
  jmespath = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1d4wac0dcd1jf6kc57891glih9w57552zgqswgy74d1xhgnk0ngf";
      type = "gem";
    };
    version = "1.4.0";
  };
  json = {
    groups = ["default" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "01v6jjpvh3gnq6sgllpfqahlgxzj50ailwhj9b3cd20hi2dx0vxp";
      type = "gem";
    };
    version = "2.1.0";
  };
  json-ld = {
    dependencies = ["multi_json" "rdf"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "08ql8j546akan51yhrjjcphwjdmrl551sz5hi2czc74993523mkw";
      type = "gem";
    };
    version = "2.2.1";
  };
  jsonapi-renderer = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "00ysmcv3nrccyimi334ida4axlfgir6cc2ryjxrf4xb97m1bfk5j";
      type = "gem";
    };
    version = "0.2.0";
  };
  jwt = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1w0kaqrbl71cq9sbnixc20x5lqah3hs2i93xmhlfdg2y3by7yzky";
      type = "gem";
    };
    version = "2.1.0";
  };
  kaminari = {
    dependencies = ["activesupport" "kaminari-actionview" "kaminari-activerecord" "kaminari-core"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1j27y5phifwpggspglmg8pmlf6n4jblxwziix9am42661c770jlm";
      type = "gem";
    };
    version = "1.1.1";
  };
  kaminari-actionview = {
    dependencies = ["actionview" "kaminari-core"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1386wshpy1ygbris0s7rv7lyzbs0v8dfqkzdwsrsgm9fd1ira640";
      type = "gem";
    };
    version = "1.1.1";
  };
  kaminari-activerecord = {
    dependencies = ["activerecord" "kaminari-core"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0q31ik5648xi2hpy61knnjd0m7rvs17i93gzwcbh3ccj1y24gv2x";
      type = "gem";
    };
    version = "1.1.1";
  };
  kaminari-core = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1cfjrhvidvgdwp9ffsm9d4c2s18k2zp3gnya3f41qb3fc6bc2q2w";
      type = "gem";
    };
    version = "1.1.1";
  };
  launchy = {
    dependencies = ["addressable"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "190lfbiy1vwxhbgn4nl4dcbzxvm049jwc158r2x7kq3g5khjrxa2";
      type = "gem";
    };
    version = "2.4.3";
  };
  letter_opener = {
    dependencies = ["launchy"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0hvvcl2n4j05vixgydld9lm2hspifn9f651l0d9qdzvlic7wh0rx";
      type = "gem";
    };
    version = "1.6.0";
  };
  letter_opener_web = {
    dependencies = ["actionmailer" "letter_opener" "railties"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "17qhwrkncrrp1bi2f7fbkm5lpnkdsiwy8jcvgr2wa97ck8y4x2bb";
      type = "gem";
    };
    version = "1.3.4";
  };
  link_header = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1yamrdq4rywmnpdhbygnkkl9fdy249fg5r851nrkkxr97gj5rihm";
      type = "gem";
    };
    version = "0.0.8";
  };
  lograge = {
    dependencies = ["actionpack" "activesupport" "railties" "request_store"];
    groups = ["production"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "00lcn7s3slfn32di4qwlx2yj5f9r2pcnd0naxrvqqwypcg1z2sdd";
      type = "gem";
    };
    version = "0.10.0";
  };
  loofah = {
    dependencies = ["crass" "nokogiri"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ccsid33xjajd0im2xv941aywi58z7ihwkvaf1w2bv89vn5bhsjg";
      type = "gem";
    };
    version = "2.2.3";
  };
  mail = {
    dependencies = ["mini_mime"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "10dyifazss9mgdzdv08p47p344wmphp5pkh5i73s7c04ra8y6ahz";
      type = "gem";
    };
    version = "2.7.0";
  };
  makara = {
    dependencies = ["activerecord"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ri6r558nylaclqhfq1zhapfsyhryggln7gw69qb9i4c1rkfnyd2";
      type = "gem";
    };
    version = "0.4.0";
  };
  marcel = {
    dependencies = ["mimemagic"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0v1kncmyh0yn9h28zri6hkfdqzr8bf26ar9bvglhgzy0chqr9dp8";
      type = "gem";
    };
    version = "0.3.2";
  };
  mario-redis-lock = {
    dependencies = ["redis"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1v9wdjcjqzpns2migxp4a5b4w82mipi0fwihbqz3q2qj2qm7wc17";
      type = "gem";
    };
    version = "1.2.1";
  };
  memory_profiler = {
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0qir6bc2rw6lac6fsjhnspqyr01sh12d75dkd630qknjwvrrq8kj";
      type = "gem";
    };
    version = "0.9.12";
  };
  method_source = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0xqj21j3vfq4ldia6i2akhn2qd84m0iqcnsl49kfpq3xk6x0dzgn";
      type = "gem";
    };
    version = "0.9.0";
  };
  microformats = {
    dependencies = ["json" "nokogiri"];
    groups = ["test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "14az36ax3n81fmwqjb5giixvxsnmxpnlfrsz012pl78x1bkrvfki";
      type = "gem";
    };
    version = "4.0.7";
  };
  mime-types = {
    dependencies = ["mime-types-data"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0fjxy1jm52ixpnv3vg9ld9pr9f35gy0jp66i1njhqjvmnvq0iwwk";
      type = "gem";
    };
    version = "3.2.2";
  };
  mime-types-data = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "07wvp0aw2gjm4njibb70as6rh5hi1zzri5vky1q6jx95h8l56idc";
      type = "gem";
    };
    version = "3.2018.0812";
  };
  mimemagic = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "00ibc1mhvdfyfyl103xwb45621nwyqxf124cni5hyfhag0fn1c3q";
      type = "gem";
    };
    version = "0.3.2";
  };
  mini_mime = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1q4pshq387lzv9m39jv32vwb8wrq3wc4jwgl4jk209r4l33v09d3";
      type = "gem";
    };
    version = "1.0.1";
  };
  mini_portile2 = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "13d32jjadpjj6d2wdhkfpsmy68zjx90p49bgf8f7nkpz86r1fr11";
      type = "gem";
    };
    version = "2.3.0";
  };
  minitest = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0icglrhghgwdlnzzp4jf76b0mbc71s80njn5afyfjn4wqji8mqbq";
      type = "gem";
    };
    version = "5.11.3";
  };
  msgpack = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "09xy1wc4wfbd1jdrzgxwmqjzfdfxbz0cqdszq2gv6rmc3gv1c864";
      type = "gem";
    };
    version = "1.2.4";
  };
  multi_json = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1rl0qy4inf1mp8mybfk56dfga0mvx97zwpmq5xmiwl5r770171nv";
      type = "gem";
    };
    version = "1.13.1";
  };
  multipart-post = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "09k0b3cybqilk1gwrwwain95rdypixb2q9w65gd44gfzsd84xi1x";
      type = "gem";
    };
    version = "2.0.0";
  };
  necromancer = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0v9nhdkv6zrp7cn48xv7n2vjhsbslpvs0ha36mfkcd56cp27pavz";
      type = "gem";
    };
    version = "0.4.0";
  };
  net-ldap = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "016igqz81a8zcwqzp5bbhryqmb2skmyf57ij3nb5z8sxwhw22jgh";
      type = "gem";
    };
    version = "0.16.1";
  };
  net-scp = {
    dependencies = ["net-ssh"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0b0jqrcsp4bbi4n4mzyf70cp2ysyp6x07j8k8cqgxnvb4i3a134j";
      type = "gem";
    };
    version = "1.2.1";
  };
  net-ssh = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0qfanf71yv8w7yl9l9wqcy68i2x1ghvnf8m581yy4pl0anfdhqw8";
      type = "gem";
    };
    version = "5.0.2";
  };
  nio4r = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1a41ca1kpdmrypjp9xbgvckpy8g26zxphkja9vk7j5wl4n8yvlyr";
      type = "gem";
    };
    version = "2.3.1";
  };
  nokogiri = {
    dependencies = ["mini_portile2"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0byyxrazkfm29ypcx5q4syrv126nvjnf7z6bqi01sqkv4llsi4qz";
      type = "gem";
    };
    version = "1.8.5";
  };
  nokogumbo = {
    dependencies = ["nokogiri"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1qr7r2ysbp8b5q78yr8l5qpaxfqdw1i2yz6nsrbavdki8mqjgj24";
      type = "gem";
    };
    version = "2.0.0";
  };
  nsa = {
    dependencies = ["activesupport" "concurrent-ruby" "sidekiq" "statsd-ruby"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1xki3jd107lc189mwwyxf19wz17dlaysrqy2jcbgyk7cdvbmhgf0";
      type = "gem";
    };
    version = "0.2.4";
  };
  oj = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "01pb6k8sfcj3i04gnwg33ld8682axzpn2kh26d7nsf44jx9k6bdd";
      type = "gem";
    };
    version = "3.7.0";
  };
  omniauth = {
    dependencies = ["hashie" "rack"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1msqr4qq7mfdvl3rg89529isrv595hvjpj2gi0say4b8nwqfggmg";
      type = "gem";
    };
    version = "1.8.1";
  };
  omniauth-cas = {
    dependencies = ["addressable" "nokogiri" "omniauth"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1nnk7cr45aj7hj19zpky58yysvjg8mn5f45sj9knpn5f9kgld7p4";
      type = "gem";
    };
    version = "1.1.1";
  };
  omniauth-saml = {
    dependencies = ["omniauth" "ruby-saml"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1pg3pw4yjd9w1rn3lkycllrvd767pydbhldgdcqbbcck01asfcfz";
      type = "gem";
    };
    version = "1.10.1";
  };
  orm_adapter = {
    groups = ["default" "pam_authentication"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1fg9jpjlzf5y49qs9mlpdrgs5rpcyihq1s4k79nv9js0spjhnpda";
      type = "gem";
    };
    version = "0.5.0";
  };
  ostatus2 = {
    dependencies = ["addressable" "http" "nokogiri"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0fj27nr38g5y52s755pmg5zifwc6n88bw2zmkc22kg4vrhs64k19";
      type = "gem";
    };
    version = "2.0.3";
  };
  ox = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15vkq18fp58504ld9vfakisxdmp68pk5y1bmmm5g7b0q25p8z5pq";
      type = "gem";
    };
    version = "2.10.0";
  };
  paperclip = {
    dependencies = ["activemodel" "activesupport" "mime-types" "mimemagic" "terrapin"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "04mlw7aqj20ry0fy92gxnxg99hy5xczff7rhywfzz4mqlhc2wgg7";
      type = "gem";
    };
    version = "6.0.0";
  };
  paperclip-av-transcoder = {
    dependencies = ["av" "paperclip"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1gcnp3fpdb5lqilcij4yqga6397nb7zyyf9lzxnqpbp7cvc18lhf";
      type = "gem";
    };
    version = "0.6.4";
  };
  parallel = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "01hj8v1qnyl5ndrs33g8ld8ibk0rbcqdpkpznr04gkbxd11pqn67";
      type = "gem";
    };
    version = "1.12.1";
  };
  parallel_tests = {
    dependencies = ["parallel"];
    groups = ["test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1rlbahdvrng1wbzhqxg0n2q92a25y2mvarmjn2qcrj9mdmlq51kr";
      type = "gem";
    };
    version = "2.26.0";
  };
  parser = {
    dependencies = ["ast"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1zjk0w1kjj3xk8ymy1430aa4gg0k8ckphfj88br6il4pm83f0n1f";
      type = "gem";
    };
    version = "2.5.3.0";
  };
  pastel = {
    dependencies = ["equatable" "tty-color"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1yf30d9kzpm96gw9kwbv31p0qigwfykn8qdis5950plnzgc1vlp1";
      type = "gem";
    };
    version = "0.7.2";
  };
  pg = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1pnjw3rspdfjssxyf42jnbsdlgri8ylysimp0s28wxb93k6ff2qb";
      type = "gem";
    };
    version = "1.1.3";
  };
  pghero = {
    dependencies = ["activerecord"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0nvg9jwynnw3brignq6raka0abrcjmm8mr8yxhvybjpmr6lyyjrd";
      type = "gem";
    };
    version = "2.2.0";
  };
  pkg-config = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0yrxwki3nzyss1fnjrhkahya0w9wgb7jg6ji995z7y4ph81zwflm";
      type = "gem";
    };
    version = "1.3.1";
  };
  posix-spawn = {
    groups = ["default"];
    platforms = [];
    source = {
      fetchSubmodules = false;
      rev = "58465d2e213991f8afb13b984854a49fcdcc980c";
      sha256 = "1mq284bps0y4yfwkhvj2j27g6lpzfhzw1bypim1a0n1js7j54vhk";
      type = "git";
      url = "https://github.com/rtomayko/posix-spawn";
    };
    version = "0.3.13";
  };
  powerpack = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1r51d67wd467rpdfl6x43y84vwm8f5ql9l9m85ak1s2sp3nc5hyv";
      type = "gem";
    };
    version = "0.1.2";
  };
  premailer = {
    dependencies = ["addressable" "css_parser" "htmlentities"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1xrhmialxn5vlp1nmf40a4db9gji4h2wbzd7f43sz64z8lvrjj6h";
      type = "gem";
    };
    version = "1.11.1";
  };
  premailer-rails = {
    dependencies = ["actionmailer" "premailer"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1avh2bkhabicf1zxla8z6ig5192h3vdzli4d2y9wmxfwgh549lmx";
      type = "gem";
    };
    version = "1.10.2";
  };
  private_address_check = {
    groups = ["production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "05phz0vscfh9chv90yc9091pifw3cpwkh76flnhrmvja1q3na4cy";
      type = "gem";
    };
    version = "0.5.0";
  };
  pry = {
    dependencies = ["coderay" "method_source"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1mh312k3y94sj0pi160wpia0ps8f4kmzvm505i6bvwynfdh7v30g";
      type = "gem";
    };
    version = "0.11.3";
  };
  pry-byebug = {
    dependencies = ["byebug" "pry"];
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0y2758593i2ij0nhmv0j1pbdfx2cgi52ns6wkij0frgnk2lf650g";
      type = "gem";
    };
    version = "3.6.0";
  };
  pry-rails = {
    dependencies = ["pry"];
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0k2d43bwmqbswfra4fkadjjbszwb11pr7qdkma91qrcrk62wqxvy";
      type = "gem";
    };
    version = "0.3.6";
  };
  public_suffix = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "08q64b5br692dd3v0a9wq9q5dvycc6kmiqmjbdxkxbfizggsvx6l";
      type = "gem";
    };
    version = "3.0.3";
  };
  puma = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1k7dqxnq0dnf5rxkgs9rknclkn3ah7lsdrk6nrqxla8qzy31wliq";
      type = "gem";
    };
    version = "3.12.0";
  };
  pundit = {
    dependencies = ["activesupport"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0s59ilsqnr3vbai66mp7jj097m6i7ivpnjpbw665s50f5z834vls";
      type = "gem";
    };
    version = "2.0.0";
  };
  raabro = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0xzdmbn48753f6k0ckirp8ja5p0xn1a92wbwxfyggyhj0hza9ylq";
      type = "gem";
    };
    version = "1.1.6";
  };
  rack = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "158hbn7rlc3czp2vivvam44dv6vmzz16qrh5dbzhfxbfsgiyrqw1";
      type = "gem";
    };
    version = "2.0.5";
  };
  rack-attack = {
    dependencies = ["rack"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "08787kd5cnm9mbvpbj73xai21fn87wyrlzfp8l753lb9qqjhdn4p";
      type = "gem";
    };
    version = "5.4.1";
  };
  rack-cors = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1j27vy1bmhbqcyzhxg8d07qassmax769xjalfwcwz6qfiq8cf013";
      type = "gem";
    };
    version = "1.0.2";
  };
  rack-protection = {
    dependencies = ["rack"];
    groups = ["default" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ylx74ravz7nvnyygq0nk3v86qdzrmqxpwpayhppyy50l72rcajq";
      type = "gem";
    };
    version = "2.0.4";
  };
  rack-proxy = {
    dependencies = ["rack"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1igdsim4ifyx9rfcjbxcwmf2vnxca3f8wmr2sj9j118a21g455pp";
      type = "gem";
    };
    version = "0.6.4";
  };
  rack-test = {
    dependencies = ["rack"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0rh8h376mx71ci5yklnpqqn118z3bl67nnv5k801qaqn1zs62h8m";
      type = "gem";
    };
    version = "1.1.0";
  };
  rails = {
    dependencies = ["actioncable" "actionmailer" "actionpack" "actionview" "activejob" "activemodel" "activerecord" "activestorage" "activesupport" "railties" "sprockets-rails"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1307cv1p6cj350hq2mi00dfgjb77rzvlhrr3h0bjz5s0a6jgwv3p";
      type = "gem";
    };
    version = "5.2.1";
  };
  rails-controller-testing = {
    dependencies = ["actionpack" "actionview" "activesupport"];
    groups = ["test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "16kdkk73mhhs73iz3i1i0ryjm84dadiyh817b3nh8acdi490jyhy";
      type = "gem";
    };
    version = "1.0.2";
  };
  rails-dom-testing = {
    dependencies = ["activesupport" "nokogiri"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1lfq2a7kp2x64dzzi5p4cjcbiv62vxh9lyqk2f0rqq3fkzrw8h5i";
      type = "gem";
    };
    version = "2.0.3";
  };
  rails-html-sanitizer = {
    dependencies = ["loofah"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1gv7vr5d9g2xmgpjfq4nxsqr70r9pr042r9ycqqnfvw5cz9c7jwr";
      type = "gem";
    };
    version = "1.0.4";
  };
  rails-i18n = {
    dependencies = ["i18n" "railties"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "05lkhc737a9dw0hd5ljmja0yp4cw39r3200s1r0n4bs7z1g3ka7l";
      type = "gem";
    };
    version = "5.1.2";
  };
  rails-settings-cached = {
    dependencies = ["rails"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0wyhyls0aqb1iw7mnaldg39w3mnbi3anmpbvb52rjwkpj2mchhnc";
      type = "gem";
    };
    version = "0.6.6";
  };
  railties = {
    dependencies = ["actionpack" "activesupport" "method_source" "rake" "thor"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "19y343dvb7vih82q2ssyhp1cirmp5sp1vpw4k5zmd1bxxkjix9qv";
      type = "gem";
    };
    version = "5.2.1";
  };
  rainbow = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0bb2fpjspydr6x0s8pn1pqkzmxszvkfapv0p4627mywl7ky4zkhk";
      type = "gem";
    };
    version = "3.0.0";
  };
  rake = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1idi53jay34ba9j68c3mfr9wwkg3cd9qh0fn9cg42hv72c6q8dyg";
      type = "gem";
    };
    version = "12.3.1";
  };
  rb-fsevent = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1lm1k7wpz69jx7jrc92w3ggczkjyjbfziq5mg62vjnxmzs383xx8";
      type = "gem";
    };
    version = "0.10.3";
  };
  rb-inotify = {
    dependencies = ["ffi"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0yfsgw5n7pkpyky6a9wkf1g9jafxb0ja7gz0qw0y14fd2jnzfh71";
      type = "gem";
    };
    version = "0.9.10";
  };
  rdf = {
    dependencies = ["hamster" "link_header"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0fjla68kfhxhq0hip1jjxcp2lpa2h8c6yzjmm4jizrj1amv2cidp";
      type = "gem";
    };
    version = "3.0.2";
  };
  rdf-normalize = {
    dependencies = ["rdf"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0h8qk3x5frqbgb4gj9ga75ddls47x8qhghscgz82gfq76m4r45g0";
      type = "gem";
    };
    version = "0.3.3";
  };
  redis = {
    groups = ["default" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0c2106d7rx12j1d7lnwqgd2v85xwc5raf9q0xv01qmnq2x167yxk";
      type = "gem";
    };
    version = "4.0.2";
  };
  redis-actionpack = {
    dependencies = ["actionpack" "redis-rack" "redis-store"];
    groups = ["default" "production"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15k41gz7nygd4yydk2yd25gghya1j7q6zifk4mdrra6bwnwjbm63";
      type = "gem";
    };
    version = "5.0.2";
  };
  redis-activesupport = {
    dependencies = ["activesupport" "redis-store"];
    groups = ["default" "production"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0rq5dhrzc1l8c7f5gx9r7mvnsk5206dfwih3yv5si5rf42nx2ay5";
      type = "gem";
    };
    version = "5.0.4";
  };
  redis-namespace = {
    dependencies = ["redis"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0r7daagrjjribn098dxwbv9zivrbq2rsffbkj2ccxyn9lmjjbgah";
      type = "gem";
    };
    version = "1.6.0";
  };
  redis-rack = {
    dependencies = ["rack" "redis-store"];
    groups = ["default" "production"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0px0wv8zripc6lrn3k0k61j6nlxda145q8sz50yvnig17wlk36gb";
      type = "gem";
    };
    version = "2.0.4";
  };
  redis-rails = {
    dependencies = ["redis-actionpack" "redis-activesupport" "redis-store"];
    groups = ["production"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0hjvkyaw5hgz7v6fgwdk8pb966z44h1gv8jarmb0gwhkqmjnsh40";
      type = "gem";
    };
    version = "5.0.2";
  };
  redis-store = {
    dependencies = ["redis"];
    groups = ["default" "production"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0cpg4fmqcyl8mm77l852xsidp8384a7s1mgbpki999swvq97svi4";
      type = "gem";
    };
    version = "1.5.0";
  };
  regexp_parser = {
    groups = ["default" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "12q3m74kmdc1mdc1nfphxj1089j425cjw9fr3h9z8x1987mgzpw3";
      type = "gem";
    };
    version = "1.2.0";
  };
  request_store = {
    dependencies = ["rack"];
    groups = ["default" "production"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1963330z03fk382fi8y231ygcbnh86m91dqlp5rh1mwy9ihzzl6d";
      type = "gem";
    };
    version = "1.4.1";
  };
  responders = {
    dependencies = ["actionpack" "railties"];
    groups = ["default" "pam_authentication"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1rhdyyvvm26f2l3fgwdp6xasfl2y0whwgy766bhdwz697mf78zfn";
      type = "gem";
    };
    version = "2.4.0";
  };
  rotp = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1w8d6svhq3y9y952r8cqirxvdx12zlkb7zxjb44bcbidb2sisy4d";
      type = "gem";
    };
    version = "2.1.2";
  };
  rpam2 = {
    groups = ["default" "pam_authentication"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1zvli3s4z1hf2l7gyfickm5i3afjrnycc3ihbiax6ji6arpbyf33";
      type = "gem";
    };
    version = "4.0.2";
  };
  rqrcode = {
    dependencies = ["chunky_png"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0h1pnnydgs032psakvg3l779w3ghbn08ajhhhw19hpmnfhrs8k0a";
      type = "gem";
    };
    version = "0.10.1";
  };
  rspec-core = {
    dependencies = ["rspec-support"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1p1s5bnbqp3sxk67y0fh0x884jjym527r0vgmhbm81w7aq6b7l4p";
      type = "gem";
    };
    version = "3.8.0";
  };
  rspec-expectations = {
    dependencies = ["diff-lcs" "rspec-support"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "18l21hy1zdc2pgc2yb17k3n2al1khpfr0z6pijlm852iz6vj0dkm";
      type = "gem";
    };
    version = "3.8.2";
  };
  rspec-mocks = {
    dependencies = ["diff-lcs" "rspec-support"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "06y508cjqycb4yfhxmb3nxn0v9xqf17qbd46l1dh4xhncinr4fyp";
      type = "gem";
    };
    version = "3.8.0";
  };
  rspec-rails = {
    dependencies = ["actionpack" "activesupport" "railties" "rspec-core" "rspec-expectations" "rspec-mocks" "rspec-support"];
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0sqj5da2kc937j5jb18jcf0hrmmzwgj7pk62j0q3qndhc2kvx88p";
      type = "gem";
    };
    version = "3.8.1";
  };
  rspec-sidekiq = {
    dependencies = ["rspec-core" "sidekiq"];
    groups = ["test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0y7pbqrbc8rjszc45vg4vz9qbn8aymgcc4ribrhvm76wrfz3ksfq";
      type = "gem";
    };
    version = "3.0.3";
  };
  rspec-support = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0p3m7drixrlhvj2zpc38b11x145bvm311x6f33jjcxmvcm0wq609";
      type = "gem";
    };
    version = "3.8.0";
  };
  rubocop = {
    dependencies = ["jaro_winkler" "parallel" "parser" "powerpack" "rainbow" "ruby-progressbar" "unicode-display_width"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ivk049z3mp12nc6v1wn35bsq1g7nz1i2r4xwzqf0v25hm2v7n1i";
      type = "gem";
    };
    version = "0.60.0";
  };
  ruby-progressbar = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1cv2ym3rl09svw8940ny67bav7b2db4ms39i4raaqzkf59jmhglk";
      type = "gem";
    };
    version = "1.10.0";
  };
  ruby-saml = {
    dependencies = ["nokogiri"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "12f3mmyds4y8f7535p79xzx0wnp7rj02h1fp2x3j2hy5vrkmz2k4";
      type = "gem";
    };
    version = "1.9.0";
  };
  rufus-scheduler = {
    dependencies = ["fugit"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "074w41a88343cbv8ydkpl3firhvh3kbh8ppldhdmpvv2g569m32i";
      type = "gem";
    };
    version = "3.5.2";
  };
  safe_yaml = {
    groups = ["default" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1hly915584hyi9q9vgd968x2nsi5yag9jyf5kq60lwzi5scr7094";
      type = "gem";
    };
    version = "1.0.4";
  };
  sanitize = {
    dependencies = ["crass" "nokogiri" "nokogumbo"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0rsb2gvqdh41miq7xjckidmgnjh3slvfqbp1hh4s6xfhc32r8g3s";
      type = "gem";
    };
    version = "5.0.0";
  };
  sass = {
    dependencies = ["sass-listen"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "18c6prbw9wl8bqhb2435pd9s0lzarl3g7xf8pmyla28zblvwxmyh";
      type = "gem";
    };
    version = "3.6.0";
  };
  sass-listen = {
    dependencies = ["rb-fsevent" "rb-inotify"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0xw3q46cmahkgyldid5hwyiwacp590zj2vmswlll68ryvmvcp7df";
      type = "gem";
    };
    version = "4.0.0";
  };
  scss_lint = {
    dependencies = ["rake" "sass"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0dv4ff1lqbgqdx99nwg059c983dhw67kvvjd21f6vf62cjx09lpn";
      type = "gem";
    };
    version = "0.57.1";
  };
  sidekiq = {
    dependencies = ["connection_pool" "rack-protection" "redis"];
    groups = ["default" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "06jws6zlyxqdbpcyvdd61ylp9cxsg2h4bs2mmz3k2ah42p5xxkjp";
      type = "gem";
    };
    version = "5.2.2";
  };
  sidekiq-bulk = {
    dependencies = ["activesupport" "sidekiq"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1yj2fwjygv93pr6ph5xyapgwq5vhspvg2hkv8mgf3d3ain082wbi";
      type = "gem";
    };
    version = "0.1.1";
  };
  sidekiq-scheduler = {
    dependencies = ["redis" "rufus-scheduler" "sidekiq" "tilt"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1n38p1ig8rx4ndqxcsc2gyzbaaax6r16b1xkn9mgcwwfx8qd5dbw";
      type = "gem";
    };
    version = "3.0.0";
  };
  sidekiq-unique-jobs = {
    dependencies = ["sidekiq" "thor"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "001bmbqbibf7r3hbdkm2sjnmdw5dznnwk89f2s7wk0xhibsczkhw";
      type = "gem";
    };
    version = "5.0.10";
  };
  simple-navigation = {
    dependencies = ["activesupport"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "08a2s18an3br3xj5j86r33q0hrkai0y157xg67h1khdskb08yylk";
      type = "gem";
    };
    version = "4.0.5";
  };
  simple_form = {
    dependencies = ["actionpack" "activemodel"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "197wzz7yy4ls4ivrvnysa28hvrrwyrq9dny9jpq6d15y2v31chqh";
      type = "gem";
    };
    version = "4.0.1";
  };
  simplecov = {
    dependencies = ["docile" "json" "simplecov-html"];
    groups = ["test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1sfyfgf7zrp2n42v7rswkqgk3bbwk1bnsphm24y7laxv3f8z0947";
      type = "gem";
    };
    version = "0.16.1";
  };
  simplecov-html = {
    groups = ["default" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1lihraa4rgxk8wbfl77fy9sf0ypk31iivly8vl3w04srd7i0clzn";
      type = "gem";
    };
    version = "0.10.2";
  };
  sprockets = {
    dependencies = ["concurrent-ruby" "rack"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "182jw5a0fbqah5w9jancvfmjbk88h8bxdbwnl4d3q809rpxdg8ay";
      type = "gem";
    };
    version = "3.7.2";
  };
  sprockets-rails = {
    dependencies = ["actionpack" "activesupport" "sprockets"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ab42pm8p5zxpv3sfraq45b9lj39cz9mrpdirm30vywzrwwkm5p1";
      type = "gem";
    };
    version = "3.2.1";
  };
  sshkit = {
    dependencies = ["net-scp" "net-ssh"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1982pcckxy811gm6z9h8brkds13mrgrx8sgmdz8dq5rg1h91y0yw";
      type = "gem";
    };
    version = "1.17.0";
  };
  stackprof = {
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1v7mkl4ng2is5h0glivhcjjkkj2shq1qzx9sg9shw9nn8xvg7i4w";
      type = "gem";
    };
    version = "0.2.12";
  };
  statsd-ruby = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1qh9w1vydx96v5y04y0k2g56k9yrsgrmbxh1d7haq07wbli0a6yz";
      type = "gem";
    };
    version = "1.2.1";
  };
  stoplight = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1c55ar2chyivz8n6xkhyq36hgpb0b7cfqfjrcyyv9sjiyrbqyhic";
      type = "gem";
    };
    version = "2.1.3";
  };
  streamio-ffmpeg = {
    dependencies = ["multi_json"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1nnxizc0371vwh0k6gqjj1b7fjszydpqfz549n6qn2q1pza3894z";
      type = "gem";
    };
    version = "3.0.2";
  };
  strong_migrations = {
    dependencies = ["activerecord"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0scrffkhjx14rrk5cn01vg20y3vvhzzb47a7c9wa864aq8j8kw7z";
      type = "gem";
    };
    version = "0.3.1";
  };
  temple = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "00nxf610nzi4n1i2lkby43nrnarvl89fcl6lg19406msr0k3ycmq";
      type = "gem";
    };
    version = "0.8.0";
  };
  terminal-table = {
    dependencies = ["unicode-display_width"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1512cngw35hsmhvw4c05rscihc59mnj09m249sm9p3pik831ydqk";
      type = "gem";
    };
    version = "1.8.0";
  };
  terrapin = {
    dependencies = ["climate_control"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0p18f05r0c5s70571gqig3z2ym74wx79s6rd45sprp207bqskzn9";
      type = "gem";
    };
    version = "0.6.0";
  };
  thor = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0nmqpyj642sk4g16nkbq6pj856adpv91lp4krwhqkh2iw63aszdl";
      type = "gem";
    };
    version = "0.20.0";
  };
  thread_safe = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0nmhcgq6cgz44srylra07bmaw99f5271l0dpsvl5f75m44l0gmwy";
      type = "gem";
    };
    version = "0.3.6";
  };
  tilt = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0020mrgdf11q23hm1ddd6fv691l51vi10af00f137ilcdb2ycfra";
      type = "gem";
    };
    version = "2.0.8";
  };
  timers = {
    dependencies = ["hitimes"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0wax58yagbc7876az5731fs4hxwzr567y9r48v0agmnm162199x7";
      type = "gem";
    };
    version = "4.1.2";
  };
  tty-color = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0zz5xa6xbrj69h334d8nx7z732fz80s1a0b02b53mim95p80s7bk";
      type = "gem";
    };
    version = "0.4.3";
  };
  tty-command = {
    dependencies = ["pastel"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1d1fghdvnlc8m5i36h7gswn21232k2f9z5ls73fhs9p5ryfs4vz7";
      type = "gem";
    };
    version = "0.8.2";
  };
  tty-cursor = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1f4rsapf4apaxn11xnqrq7axgrlvn6pdlqxqb2g34jnpfh5yrk1i";
      type = "gem";
    };
    version = "0.6.0";
  };
  tty-prompt = {
    dependencies = ["necromancer" "pastel" "timers" "tty-cursor" "tty-reader"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0bnrpz52ga2pwrq5lbjyh4v8v8rhliw749vgzlahzxivvyg93k70";
      type = "gem";
    };
    version = "0.17.1";
  };
  tty-reader = {
    dependencies = ["tty-cursor" "tty-screen" "wisper"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0cy5yyanfgyxxy0g6abiwz2jlbxwdjavk63yjl3gbdjr1j5jgy23";
      type = "gem";
    };
    version = "0.4.0";
  };
  tty-screen = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0azpjgyhdm8ycblnx9crq3dgb2x8yg454a13n60zfpsc0n138sw1";
      type = "gem";
    };
    version = "0.6.5";
  };
  twitter-text = {
    dependencies = ["unf"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1732h7hy1k152w8wfvjsx7b79alk45i5imwd37ia4qcx8hfm3gvg";
      type = "gem";
    };
    version = "1.14.7";
  };
  tzinfo = {
    dependencies = ["thread_safe"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1fjx9j327xpkkdlxwmkl3a8wqj7i4l4jwlrv3z13mg95z9wl253z";
      type = "gem";
    };
    version = "1.2.5";
  };
  tzinfo-data = {
    dependencies = ["tzinfo"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "12il6cwzprzrjqv2szxwr3a5zd68q4p37vxfkv0br0c61hi2p8j9";
      type = "gem";
    };
    version = "1.2018.7";
  };
  unf = {
    dependencies = ["unf_ext"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0bh2cf73i2ffh4fcpdn9ir4mhq8zi50ik0zqa1braahzadx536a9";
      type = "gem";
    };
    version = "0.1.4";
  };
  unf_ext = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "06p1i6qhy34bpb8q8ms88y6f2kz86azwm098yvcc0nyqk9y729j1";
      type = "gem";
    };
    version = "0.0.7.5";
  };
  unicode-display_width = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0040bsdpcmvp8w31lqi2s9s4p4h031zv52401qidmh25cgyh4a57";
      type = "gem";
    };
    version = "1.4.0";
  };
  uniform_notifier = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1yblj2rhlabxiqkqn7v3mrk8rnkmvsp3l3mp6c3hrb08rxidssga";
      type = "gem";
    };
    version = "1.11.0";
  };
  warden = {
    dependencies = ["rack"];
    groups = ["default" "pam_authentication"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0va966lhpylcwbqb9n151kkihx30agh0a57mwjwdxyanll4s1q12";
      type = "gem";
    };
    version = "1.2.7";
  };
  webmock = {
    dependencies = ["addressable" "crack" "hashdiff"];
    groups = ["test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "03994dxs4xayvkxqp01dd1ivhg4xxx7z35f7cxw7y2mwj3xn24ib";
      type = "gem";
    };
    version = "3.4.2";
  };
  webpacker = {
    dependencies = ["activesupport" "rack-proxy" "railties"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0bw01ihvxpy05xzz3wq6p9d3lw7n4x10ivfrh70hlrjyixmapws6";
      type = "gem";
    };
    version = "3.5.5";
  };
  webpush = {
    dependencies = ["hkdf" "jwt"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0qhamsbzixns0fss77c2bdrni1lk192kbm51r2q6m6gk2iqyk0xv";
      type = "gem";
    };
    version = "0.3.4";
  };
  websocket-driver = {
    dependencies = ["websocket-extensions"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1551k3fs3kkb3ghqfj3n5lps0ikb9pyrdnzmvgfdxy8574n4g1dn";
      type = "gem";
    };
    version = "0.7.0";
  };
  websocket-extensions = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "034sdr7fd34yag5l6y156rkbhiqgmy395m231dwhlpcswhs6d270";
      type = "gem";
    };
    version = "0.1.3";
  };
  wisper = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ar2wn3pxnffyzcmf67y67b8lnhgn9zayqhqp26jwqa3d73j71kd";
      type = "gem";
    };
    version = "2.0.0";
  };
  xpath = {
    dependencies = ["nokogiri"];
    groups = ["default" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0bh8lk9hvlpn7vmi6h4hkcwjzvs2y0cmkk3yjjdr8fxvj6fsgzbd";
      type = "gem";
    };
    version = "3.2.0";
  };
}