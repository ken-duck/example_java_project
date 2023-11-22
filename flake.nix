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

        mkMvn = { name, settingsFile, centralUrl }: pkgs.writeShellApplication {
          inherit name;

          runtimeInputs = with pkgs; [ maven ];

          text = ''
            mvn \
               --settings='${settingsFile}' \
              -Dcentral.url='${centralUrl}'\
               "$@";
          '';
        };

        mvnLocal = mkMvn {
          name = "mvnLocal";
          settingsFile = "settings-local.xml";
          centralUrl = "http://localhost:3000";
        };

        mvnStaging = mkMvn {
          name = "mvnStaging";
          settingsFile = "settings-staging.xml";
          centralUrl = "https://staging.portal.central.sonatype.dev";
        };
      in
      rec {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            maven
            jdk17
            gnupg

            mvnLocal
            mvnStaging

            # Nix tooling
            nixpkgs-fmt
          ];
        };
      });
}
