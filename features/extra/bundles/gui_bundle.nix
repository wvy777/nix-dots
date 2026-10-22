{ config, ... }: {
  nixos.imports = with config.flake.modules.nixos; [
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

  darwin.imports = with config.flake.modules.darwin; [
    zen-browser
    zed-editor
    ghostty
    localsend
    rift
    obsidian
    vicinae
    wallpaper
  ];
}
