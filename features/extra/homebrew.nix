{ inputs, ... }: {
  darwin = { config, pkgs, user, ... }: {
    imports = [
      inputs.nix-homebrew.darwinModules.default
    ];

    environment.systemPackages = with pkgs; [
      mas
    ];

    nix-homebrew = {
      enable = true;
      enableRosetta = true;
      inherit user;

      mutableTaps = false;
      taps = {
        "homebrew/homebrew-core" = inputs.homebrew-core;
        "homebrew/homebrew-cask" = inputs.homebrew-cask;
      };
    };

    homebrew = {
      enable = true;

      onActivation = {
        upgrade = true;

        # https://nix-darwin.github.io/nix-darwin/manual/index.html#opt-homebrew.onActivation.cleanup
        cleanup = "zap";
      };

      # Optional: Align homebrew taps config with nix-homebrew
      taps = builtins.attrNames config.nix-homebrew.taps;
    };
  };
}
