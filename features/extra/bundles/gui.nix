{ config, ... }: {
  flake.modules.nixos.gui_bundle = {
    imports = with config.flake.modules.nixos; [
      zen-browser
      zed-editor
      niri
      ghostty
      localsend
      obsidian
      vicinae
      wallpaper
      mako
    ];
  };

  flake.modules.darwin.gui_bundle = {
    imports = with config.flake.modules.darwin; [
      zen-browser
      zed-editor
      ghostty
      localsend
      obsidian
      vicinae
      wallpaper
    ];
  };
}
