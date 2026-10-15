  {
    inputs = {
      nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
      flake-parts.url = "github:hercules-ci/flake-parts";
    };

    outputs = { flake-parts, nixpkgs, ... }@inputs:
      flake-parts.lib.mkFlake { inherit inputs; } {
        systems = [
          "x86_64-linux"
          "aarch64-linux"
          "aarch64-darwin"
          "x86_64-darwin"
        ];

        perSystem = { pkgs, self', ... }: {
          packages."my-project" = pkgs.python3Packages.buildPythonApplication {
            pname = "my-project";
            version = "0.1.0";

            src = ./.;

            pyproject = true;
            build-system = with pkgs.python3Packages; [ setuptools ];

            dependencies = with pkgs.python3Packages; [];
          };

          packages.default = self'.packages."my-project";

          devShells.default = pkgs.mkShellNoCC {
            packages = with pkgs; [
              (python3.withPackages (pp: with pp; []))
              nixd
              nil
              watchexec
            ];

            env = {
              PYTHONDONTWRITEBYTECODE = 1;
            };
          };
        };
      };
  }
