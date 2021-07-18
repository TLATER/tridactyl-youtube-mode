{
  description = "YouTube mode for tridactyl";

  inputs = {
    nixpkgs.url = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:

    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ self.overlay ];
        };
      in rec {
        defaultPackage = pkgs.tridactyl-youtube-mode;
        packages.tridactyl-youtube-mode = pkgs.tridactyl-youtube-mode;

        devShell = pkgs.mkShell {
          buildInputs = with pkgs;
            [
              # Language server
              deno
            ];
        };
      }) // {
        overlay = final: prev: {
          tridactyl-youtube-mode =
            prev.callPackage ./nix/tridactyl-youtube-mode.nix { };
        };
      };
}
