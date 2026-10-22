{ inputs, ... }: {
  home = { pkgs, ... }: {
    imports = [
      inputs.stylix.homeModules.stylix
    ];

    stylix = {
      enable = true;
      polarity = "dark";
      base16Scheme = "${pkgs.base16-schemes}/share/themes/mountain.yaml";

      fonts = {
        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font";
        };
        emoji = {
          package = pkgs.noto-fonts-color-emoji;
          name = "Noto Color Emoji";
        };
      };

      overlays.enable = false;

      targets = {
        vscode.enable = false;
        zen-browser.enable = false;
        firefox.enable = false;
        zed.enable = false;
        obsidian.enable = false;
        vicinae = {
          fonts.enable = false;
          opacity.enable = false;
        };
        nixcord.enable = false;
      };
    };
  };

  nixos_home = { pkgs, ... }: {
    home.pointerCursor.enable = true;

    stylix = {
      cursor = {
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
        size = 24;
      };
      icons = {
        enable = true;
        dark = "MoreWaita";
        package = pkgs.morewaita-icon-theme;
      };
    };
  };
}
