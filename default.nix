{ lib
, llvmPackages_11
, cmake
, spdlog
, abseil-cpp
, xorg }:

llvmPackages_11.stdenv.mkDerivation rec {
  pname = "cpp-examples";
  version = "0.1.0";
  
  src = ./.;

  nativeBuildInputs = [ cmake ];
  buildInputs = [ spdlog abseil-cpp xorg.libX11 ];

  cmakeFlags = [
    "-DENABLE_TESTING=OFF"
    "-DENABLE_INSTALL=ON"
  ];

  meta = with lib; {
    homepage = "https://github.com/nixvital/nix-based-cpp-starterkit";
    description = ''
      A template for Nix based C++ project setup.";
    '';
    licencse = licenses.mit;
    platforms = with platforms; linux ++ darwin;
    maintainers = [ maintainers.breakds ];    
  };
}
