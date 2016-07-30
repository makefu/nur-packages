{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  proj = "wake-on-lan";
  name = "wol-${version}";
  version = "0.7.1";

  enableParallelBuilding = true;

  src = fetchurl {
    url = "mirror://sourceforge/${proj}/${name}.tar.gz";
    sha256 = "08i6l5lr14mh4n3qbmx6kyx7vjqvzdnh3j9yfvgjppqik2dnq270";
  };

  meta = {
    description = "simple wake-on-lan client";
    homepage = https://sourceforge.net/projects/wake-on-lan/;
    license = stdenv.lib.licenses.gpl2;
    platforms = stdenv.lib.platforms.linux;
    maintainers = with stdenv.lib.maintainers; [ makefu ];
  };
}
