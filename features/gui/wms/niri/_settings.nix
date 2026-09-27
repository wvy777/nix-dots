{
  wayland.windowManager.niri.settings = {
    prefer-no-csd = true;

    hotkey-overlay = {
      skip-at-startup = true;
      hide-not-bound = true;
    };

    output = [{
      _args = [ "DP-3" ];
      mode = "1920x1080@144";
    }];

    input = {
      keyboard = {
        xkb = {
          layout = "us,tr";
        };
      };
    };

    layout = {
      gaps = 16;

      border.width = 4;
      focus-ring.off = [];

      preset-column-widths._children = [
        { proportion = 0.33333; }
        { proportion = 0.5; }
        { proportion = 0.66667; }
        { proportion = 1.0; }
      ];

      preset-window-heights._children = [
        { proportion = 0.33333; }
        { proportion = 0.5; }
        { proportion = 0.66667; }
        { proportion = 1.0; }
      ];

      background-color = "transparent";
    };

    overview = {
      backdrop-color = "#000";
      workspace-shadow.off = [];
    };

    window-rule = [
      {
        geometry-corner-radius = 10;
        draw-border-with-background = false;
        clip-to-geometry = true;
      }
    ];
  };
}
