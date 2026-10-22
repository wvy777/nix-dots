{ inputs, ... }: {
  home = {
    imports = [
      inputs.nixcord.homeModules.default
    ];

    programs.nixcord = {
      enable = true;
      equibop.enable = true;
      discord.equicord.enable = true;

      config = {
        plugins = {
          messageTranslate = {
            enable = true;
            showOriginal = "orig-in-subtext";
            excludedLanguages = "en, tr";
          };

          messageLinkTooltip.enable = true;
          messageLoggerEnhanced.enable = true;
          readAllNotificationsButton.enable = true;
        };
      };
    };
  };

  nixos = {
    custom.persist = {
      home.directories = [
        ".config/equibop"
      ];
    };
  };

  darwin = {
    homebrew.casks = [
      "equibop"
    ];
  };
}
