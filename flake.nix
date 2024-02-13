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
            #!/usr/bin/env bash
            git_root=$(git rev-parse --show-toplevel)
            settings_file="$git_root/${settingsFile}"
            mvn \
               --settings="$settings_file" \
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
            gradle
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
