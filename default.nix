{ lib, stdenv, libX11 }:

stdenv.mkDerivation rec {
  pname = "tinywm";
  version = "2014-04-22";

  src = ./.;

  buildInputs = [ libX11 ];

  dontConfigure = true;

  buildPhase = ''
    $CC -Wall -Wextra -std=c11 -pedantic -I${libX11}/include ./src/main.c -L${libX11}/lib -lX11 -o nwm
  '';

  #installPhase = ''
  #  install -dm755 $out/bin $out/share/doc/${pname}-${version}
  #  install -m755 tinywm -t $out/bin/
  #  # The annotated source code is a piece of documentation
  #  install -m644 annotated.c README -t $out/share/doc/${pname}-${version}
  #'';
}
