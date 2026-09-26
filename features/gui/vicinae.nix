{ inputs, config, ... }: {
  flake.modules.homeManager.vicinae = { pkgs, ...}: let
    system = pkgs.stdenv.hostPlatform.system;
  in {
    home.packages = with pkgs; [
      pulseaudio
      sqlite
      playerctl
    ];

    programs.vicinae = {
      enable = true;

      systemd = {
        enable = true;
        autoStart = true;
      };

      extensions = with inputs.vicinae-extensions.packages.${system}; [
        nix
        zed-recents
        process-manager
        pulseaudio
        player-pilot
        color-converter

        # https://github.com/vicinaehq/extensions/blob/main/flake.nix#L66
        # bluetooth
      ];

      settings = {
        close_on_focus_loss = true;
        consider_preedit = true;
        pop_to_root_on_close = true;

        font.normal.size = 11;
        launcher_window = {
          opacity = 0.85;
          blur.enabled = false;
        };
      };
    };
  };

  flake.modules.nixos.vicinae = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      vicinae
    ];

    custom.persist = {
      home.directories = [
        ".local/share/vicinae"
        ".cache/vicinae"
      ];
    };
  };

  flake.modules.darwin.vicinae = {
    homebrew.casks = [
      "vicinae"
    ];
  };
}
