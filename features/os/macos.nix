{
  flake.modules.darwin.macos = { user, ... }: {
    security.pam.services.sudo_local.touchIdAuth = true;

    system.startup.chime = false;

    system.keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };

    system.defaults = {
      dock = {
        tilesize = 48;
        magnification = true;
        largesize = 54;
        mru-spaces = false;
        show-recents = false;
        minimize-to-application = true;

        persistent-apps = let
          hm-apps = "/Users/${user}/Applications/Home Manager Apps";
        in [
          { app = "${hm-apps}/Ghostty.app"; }
          { app = "${hm-apps}/Zed.app"; }
          { app = "${hm-apps}/Zen Browser (Beta).app"; }
          { app = "/Applications/Equibop.app"; }
          { app = "${hm-apps}/Obsidian.app"; }
        ];

        wvous-bl-corner = 4; # Desktop
        wvous-br-corner = 13; # Lock Screen
        wvous-tl-corner = 3; # Application Windows
        wvous-tr-corner = 1; # Disabled
      };

      finder = {
        NewWindowTarget = "Home";
        FXPreferredViewStyle = "Nlsv";
        FXEnableExtensionChangeWarning = false;
        ShowPathbar = true;
        CreateDesktop = false;
        QuitMenuItem = true;
      };

      trackpad = {
        Clicking = true;
        TrackpadRightClick = true;
      };

      controlcenter = {
        BatteryShowPercentage = true;
      };

      loginwindow = {
        GuestEnabled = false;
        DisableConsoleAccess = true;
      };

      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        AppleShowAllExtensions = true;

        ApplePressAndHoldEnabled = false;
        InitialKeyRepeat = 15;
        KeyRepeat = 2;

        "com.apple.swipescrolldirection" = false;
        "com.apple.mouse.tapBehavior" = 1;
      };

      CustomUserPreferences = {
        "com.apple.Siri" = {
          VoiceTriggerUserEnabled = 1;
        };

        "com.apple.AppleMultitouchTrackpad" = {
          TrackpadThreeFingerHorizSwipeGesture = 2;
          TrackpadThreeFingerVertSwipeGesture = 2;
        };

        "com.apple.desktopservices" = {
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };

        "com.apple.symbolichotkeys" = {
          AppleSymbolicHotKeys = {
            "60".enabled = true;
            "61".enabled = true;
          };
        };
      };
    };
  };
}
