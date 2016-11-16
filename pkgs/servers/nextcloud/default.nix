{ stdenv, fetchurl, fetchpatch }:

stdenv.mkDerivation rec {
  name= "nextcloud-${version}";
  version = "10.0.1";

  src = fetchurl {
    url = "https://download.nextcloud.com/server/releases/${name}.tar.bz2";
    sha256 = "09cbjxsr6sdjrq37rmwmg6r1x3625bqcrd37ja6cmmrgy0l2lh9r";
  };

  patchPhase = ''
    sed 's|configFileWritable = |configFileWritable = true;//|g' lib/base.php > lib/a
    mv lib/a lib/base.php
  '';

  installPhase = ''
    mkdir -p $out/
    cp -R . $out/

 
    cd $out
    rm -Rf config
    ln -s /var/lib/nextcloud/config config
    rm -Rf data
    ln -s /var/lib/nextcloud/data data
    mv apps apps_
    ln -s /var/lib/nextcloud/apps apps
  '';

  meta = {
    description = "Sharing solution for files, calendars, contacts and more";
    homepage = https://nextcloud.com;
    maintainers = with stdenv.lib.maintainers; [ schneefux ];
    license = stdenv.lib.licenses.agpl3Plus;
    platforms = with stdenv.lib.platforms; unix;
  };
}
