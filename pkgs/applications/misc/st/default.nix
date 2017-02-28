{ stdenv, fetchurl, fetchpatch, pkgconfig, writeText, libX11, ncurses, libXext, libXft, 
fontconfig, conf ? null, patches ? []}:


with stdenv.lib;

stdenv.mkDerivation rec {
  name = "st-0.7";
  
  src = fetchurl {
    url = "http://dl.suckless.org/st/${name}.tar.gz";
    sha256 = "00309qiw20rc89696pk8bdr7ik4r1aarik7jxqk8k66cdj80v1zp";
  };

  patches = [
    (fetchpatch {
      url = "http://st.suckless.org/patches/st-scrollback-0.7.diff";
      sha256 = "1dng2hfda3hlrfiw0sq00k57yppmqlqk2wa4dd5pmmx8b9db28gp";
    })
    ./st-config.diff
  ];

  configFile = optionalString (conf!=null) (writeText "config.def.h" conf);
  preBuild = optionalString (conf!=null) "cp ${configFile} config.def.h";
  
  buildInputs = [ pkgconfig libX11 ncurses libXext libXft fontconfig ];

  NIX_LDFLAGS = "-lfontconfig";

  installPhase = ''
    TERMINFO=$out/share/terminfo make install PREFIX=$out
  '';
    
  meta = {
    homepage = http://st.suckless.org/;
    license = stdenv.lib.licenses.mit;
    maintainers = with maintainers; [viric];
    platforms = platforms.linux;
  };
}
