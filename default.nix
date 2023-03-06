{ lib, stdenv, libX11 }:

stdenv.mkDerivation rec {
  name = "nwm";

  src = ./.;

  buildInputs = [ libX11 ];

  dontConfigure = true;

  buildPhase = ''
    $CC -Wall -Wextra -std=c11 -pedantic -I${libX11}/include ./src/main.c -L${libX11}/lib -lX11 -o nwm
  '';
}
