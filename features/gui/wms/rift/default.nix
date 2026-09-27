{ config, inputs, ... }: {
  flake.modules.homeManager.rift = { user, ... }: {
    home.file = {
      ".config/rift/config.toml".text = (builtins.readFile ./config.toml) + ''
        "Alt + Enter" = { "exec" = ["open", "-a", "/Users/${user}/Applications/Home Manager Apps/Ghostty.app"] }
      '';
    };
  };

  flake.modules.darwin.rift = {
    nix-homebrew = {
      taps."acsandmann/homebrew-tap" = inputs.acsandmann-tap;
      trust = {
        taps = [ "acsandmann/tap" ];
      };
    };

    homebrew = {
      brews = [
        "acsandmann/tap/rift"
      ];
    };

    home-manager.sharedModules = with config.flake.modules.homeManager; [
      rift
    ];
  };
}
