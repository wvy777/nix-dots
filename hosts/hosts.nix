{ config, inputs, ... }: let
  mkHost = { host, system }: let
    pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    user = "kaanw";

    specialArgs = {
      inherit user host;
    };

    commonHomeManagerModule = {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = specialArgs;
      home-manager.users.${user}.home = {
        sessionVariables = {
          NIXPKGS_ALLOW_UNFREE = 1;
        };
      };
    };
  in
    if system == "x86_64-linux" || system == "aarch64-linux" then
      inputs.nixpkgs.lib.nixosSystem {
        inherit system pkgs specialArgs;

        modules = [
          config.flake.modules.nixos.${host}

          inputs.disko.nixosModules.default

          inputs.home-manager.nixosModules.default
          commonHomeManagerModule
        ];
      }
    else if system == "aarch64-darwin" || system == "x86_64-darwin" then
      inputs.nix-darwin.lib.darwinSystem {
        inherit system pkgs specialArgs;

        modules = [
          config.flake.modules.darwin.${host}

          inputs.home-manager.darwinModules.default
          commonHomeManagerModule
        ];
      }
    else
      throw "Unsupported system";

  mkHosts = builtins.mapAttrs (
    host: params: mkHost ({ inherit host; } // params)
  );
in {
  flake.nixosConfigurations = mkHosts {
    "b550" = { system = "x86_64-linux"; };
  };

  flake.darwinConfigurations = mkHosts {
    "m4-pro" = { system = "aarch64-darwin"; };
  };
}
