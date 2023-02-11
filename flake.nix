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
        packageName = "nwm";
        config = {};
        overlays = [];
      in {
        packages.${packageName} = pkgs.${packageName};

        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            just
            gcc
          ];
        };
      });
}
