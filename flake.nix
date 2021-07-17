{
  description = "YouTube mode for tridactyl";

  inputs = {
    nixpkgs.url = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:

    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in rec {
        packages = {
          tridactyl-youtube-mode =
            pkgs.callPackage ./nix/tridactyl-youtube-mode.nix { };
        };
        defaultPackage = packages.${system}.tridactyl-youtube-mode;

        overlay = final: prev: {
          tridactyl-youtube-mode = defaultPackage.${system};
        };

        devShell = pkgs.mkShell {
          buildInputs = with pkgs;
            [
              # Language server
              deno
            ];
        };
      });
}
