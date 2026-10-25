{ inputs, ... }: {
  name = "rift";

  darwin_home = { config, lib, ... }: {
    home.file = {
      ".config/rift/config.toml".text = (builtins.readFile ./config.toml)
        + lib.optionalString (config.programs.ghostty.enable) ''
          "Alt + Enter" = { "exec" = ["osascript", "${./ghostty-new-window.applescript}"] }
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
