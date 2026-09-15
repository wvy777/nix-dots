{ config, ... }: {
  flake.modules.nixos.b550 = {
    imports = with config.flake.modules.nixos; [
      gui_bundle
      os_bundle
      shell_bundle

      chromium
      preservation
      steam
      stylix
      neovim
      neovide
      ddnet
      flatpak
      audiorelay
      equibop
      amdgpu
    ];

    system.stateVersion = "26.05";
  };
}
