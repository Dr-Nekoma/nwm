{
  description = "Nekoma Window Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs = { flake-utils, nixpkgs, self, ... }:
    # Add the system/architecture you would like to support here.
    flake-utils.lib.eachSystem [
      "x86_64-linux"
      "i686-linux"
      "aarch64-linux"
      "x86_64-darwin"
    ] (system: 
      let
        pkgs = import nixpkgs { inherit config overlays system; };
        packageName = "nwm";
        config = {};
        overlays = [];
      in {

        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            just
            gcc
            xorg.libX11
            xorg.libX11.dev
            dmenu
            emacs
            # Headers not found
            clang-tools
            # LSP std
            llvmPackages_latest.libstdcxxClang
            # stdlib for cpp
            llvmPackages_latest.libcxx
          ];
        };
        defaultPackage = pkgs.callPackage ./default.nix {};
      });
}
