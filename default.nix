{ lib, stdenv, libX11, clang-tools, llvmPackages_latest }:

stdenv.mkDerivation rec {
  name = "nwm";

  src = ./src;

  buildInputs = [ libX11 clang-tools llvmPackages_latest.libstdcxxClang llvmPackages_latest.libcxx ];

  dontConfigure = true;

  buildPhase = ''
    $CC -Wall -Wextra -std=c11 -pedantic -I${libX11}/include nwm.c -L${libX11}/lib -lX11 -o nwm
  '';

  installPhase = ''
    mkdir -p $out/bin
    mv nwm $out/bin/nwm
  '';
}
