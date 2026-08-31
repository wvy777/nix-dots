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
    ];

    # https://wiki.nixos.org/wiki/AMD_GPU#Basic_Setup
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    # https://wiki.nixos.org/wiki/AMD_GPU#Low_resolution_during_initramfs_phase
    hardware.amdgpu.initrd.enable = true;

    system.stateVersion = "26.05";
  };
}
