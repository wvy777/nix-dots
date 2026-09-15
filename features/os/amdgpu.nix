{
  flake.modules.nixos.amdgpu = {
    # https://wiki.nixos.org/wiki/AMD_GPU#Basic_Setup
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    # https://wiki.nixos.org/wiki/AMD_GPU#Low_resolution_during_initramfs_phase
    hardware.amdgpu.initrd.enable = true;
  };
}
