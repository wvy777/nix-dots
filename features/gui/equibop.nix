{ config, inputs, ... }: {
  flake.modules.homeManager.equibop = {
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

  flake.modules.nixos.equibop = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      equibop
    ];

    custom.persist = {
      home.directories = [
        ".config/equibop"
      ];
    };
  };

  flake.modules.darwin.equibop = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      equibop
    ];

    homebrew.casks = [
      "equibop"
    ];
  };
}
