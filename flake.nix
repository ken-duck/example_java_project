{
  description = "";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages."${system}";
      in
      rec {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            maven
            jdk17
            gnupg

            # Nix tooling
            nixpkgs-fmt
          ];

          MAVEN_ARGS = "--settings=settings.xml";
        };
      });
}
