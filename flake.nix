{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs = { flake-utils, nixpkgs, self, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit config overlays system; };
        config = {};
        overlays = [];
      in {
        packages.default = pkgs.callPackage ./default.nix {};

        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            just
            gcc
            xorg.libX11
            xorg.libX11.dev
            xorg.libXft
            xorg.libXinerama            
          ];
        };
      });
}
