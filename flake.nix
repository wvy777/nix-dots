{
  outputs = { nixpkgs, flake-parts, ... }@inputs: let
    inherit (nixpkgs.lib.fileset) toList fileFilter;
    inherit (nixpkgs.lib) hasPrefix lists;

    import-tree = path: toList (fileFilter (f: f.hasExt "nix" && !(hasPrefix "_" f.name)) path);
  in
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];

      imports = lists.flatten [
        flake-parts.flakeModules.modules
        (import-tree ./features)
        (import-tree ./hosts)
        (import-tree ./packages)
      ];

      flake.templates = builtins.mapAttrs
        (name: _: { path = ../templates/${name}; description = ""; })
        (builtins.readDir ../templates);

      perSystem = { pkgs, ... }: {
        devShells.default = pkgs.mkShellNoCC {
          buildInputs = with pkgs; [
            nixd
            nil
          ];

          shellHook = ''
            git status --short
          '';
        };
      };
    };

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
    flake-parts.url = "github:hercules-ci/flake-parts";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    preservation.url = "github:nix-community/preservation";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-nix = {
      url = "git+https://codeberg.org/BANanaD3V/niri-nix";
    };

    vicinae-extensions = {
      url = "github:vicinaehq/extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix4nvchad = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };
}
