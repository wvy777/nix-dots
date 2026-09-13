{ lib, ... }: {
  wayland.windowManager.niri.settings.binds = {
    "Mod+Return".spawn = [ "ghostty" ];
    "Mod+Space".spawn = [ "vicinae" "toggle" ];
    "Mod+E".spawn = [ "nautilus" ];

    "Mod+B".spawn = [ "zen-beta" ];
    "Mod+Shift+B".spawn = [ "zen-beta" "--private-window" ];

    "Mod+S".screenshot = [];
    "Mod+Shift+S".screenshot-window = [];

    "Ctrl+Space".switch-layout = "next";

    "Mod+Shift+Slash".show-hotkey-overlay = [];

    "Mod+Q".close-window = [];
    "Mod+Shift+Q".quit = {
      _props.skip-confirmation = true;
    };

    "Mod+F".fullscreen-window = [];
    "Mod+M".maximize-column = [];
    "Mod+Shift+M".expand-column-to-available-width = [];

    "Mod+O".toggle-overview = [];
    "Mod+C".center-column = [];

    "Mod+V".switch-focus-between-floating-and-tiling = [];
    "Mod+Shift+V".toggle-window-floating = [];

    "Mod+D".switch-preset-column-width = [];
    "Mod+Shift+D".switch-preset-window-height = [];

    "Mod+Minus".set-column-width = "-10%";
    "Mod+Equal".set-column-width = "+10%";
    "Mod+Shift+Minus".set-window-height = "-10%";
    "Mod+Shift+Equal".set-window-height = "+10%";

    "Mod+Up".focus-window-or-workspace-up = [];
    "Mod+Down".focus-window-or-workspace-down = [];
    "Mod+Left".focus-column-left-or-last = [];
    "Mod+Right".focus-column-right-or-first = [];

    "Mod+Shift+Up".move-window-up-or-to-workspace-up = [];
    "Mod+Shift+Down".move-window-down-or-to-workspace-down = [];
    "Mod+Shift+Left".move-column-left = [];
    "Mod+Shift+Right".move-column-right = [];

    "Mod+BracketLeft".consume-or-expel-window-left = [];
    "Mod+BracketRight".consume-or-expel-window-right = [];
    "Mod+Comma".consume-window-into-column = [ ];
    "Mod+Period".expel-window-from-column = [ ];

    "Mod+WheelScrollDown" = {
      focus-column-right = [];
      _props.cooldown-ms = 150;
    };
    "Mod+WheelScrollUp" = {
      focus-column-left = [];
      _props.cooldown-ms = 150;
    };

    "Mod+Ctrl+WheelScrollDown" = {
      _props.cooldown-ms = 150;
      move-column-right = [];
    };
    "Mod+Ctrl+WheelScrollUp" = {
      _props.cooldown-ms = 150;
      move-column-left = [];
    };

    "Mod+Shift+WheelScrollDown" = {
      focus-workspace-down = [];
      _props.cooldown-ms = 150;
    };
    "Mod+Shift+WheelScrollUp" = {
      focus-workspace-up = [];
      _props.cooldown-ms = 150;
    };

    "Mod+Shift+Ctrl+WheelScrollDown" = {
      _props.cooldown-ms = 150;
      move-column-to-workspace-down = [];
    };
    "Mod+Shift+Ctrl+WheelScrollUp" = {
      _props.cooldown-ms = 150;
      move-column-to-workspace-up = [];
    };
  } // lib.mergeAttrsList (lib.genList (i: {
    "Mod+${toString i}".focus-workspace = i;
    "Mod+Shift+${toString i}".move-window-to-workspace = i;
    "Mod+Ctrl+${toString i}".move-column-to-workspace = i;
  }) 10);
}
