{ stdenv
, fetchurl
, alsaLib
, unzip
, openssl_1_0_2
, zlib
, libjack2
, autoPatchelfHook
, pulseaudio
}:

stdenv.mkDerivation rec {
  name = "studio-link-${version}";
  version = "20.01.0";

  src = fetchurl {
    url = "https://download.studio.link/releases/v${version}-beta/linux/studio-link-standalone-v${version}.tar.gz";
    sha256 = "0mjbyb13ik5cy20pjk8vsx70ayf8fvbl2sk0air9jdv0qvdsdb9z";
  };
  unpackPhase = ''
    mkdir -p $out/bin
    tar -C $out/bin -xf $src
    mv $out/bin/studio-link-standalone-v${version} $out/bin/studio-link
  '';
  nativeBuildInputs = [ unzip autoPatchelfHook ];
  buildInputs = [
    alsaLib
    pulseaudio
    zlib
    stdenv.cc.cc
  ];

  installPhase = ":";

  meta = with stdenv.lib; {
    homepage = https://studio-link.com;
    description = "Voip transfer";
    platforms = platforms.linux;
    maintainers = with maintainers; [ makefu ];
  };
}
