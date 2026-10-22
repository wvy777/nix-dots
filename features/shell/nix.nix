{ inputs, ... }: let
  sharedConfig = { pkgs, lib, ...}: {
    nix = let
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") inputs;
      registry = lib.mapAttrs (_: flake: { inherit flake; }) inputs;
    in {
      package = pkgs.nixVersions.latest;

      # Disable channels and add the flake inputs to the registry
      channel.enable = false;
      inherit nixPath registry;

      settings = {
        warn-dirty = false;
        nix-path = nixPath;

        # Removes ~/.nix-profile and ~/.nix-defexpr
        use-xdg-base-directories = true;

        # Don't use the global flake registry, define everything explicitly
        flake-registry = "";

        experimental-features = [
          "nix-command"
          "flakes"
          "pipe-operators"
        ];

        substituters = [
          "https://nix-community.cachix.org"
        ];
        trusted-public-keys = [
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        ];
      };
    };
  };
in {
  nixos = {
    imports = [ sharedConfig ];

    custom.persist = {
      home.directories = [
        ".cache/nix"
      ];
    };
  };

  darwin = {
    imports = [ sharedConfig ];
  };
}
