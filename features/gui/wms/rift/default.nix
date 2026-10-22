{ inputs, ... }: {
  name = "rift";

  darwin_home = { user, ... }: {
    home.file = {
      ".config/rift/config.toml".text = (builtins.readFile ./config.toml) + ''
        "Alt + Enter" = { "exec" = ["open", "-a", "/Users/${user}/Applications/Home Manager Apps/Ghostty.app"] }
      '';
    };
  };

  darwin = {
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
  };
}
