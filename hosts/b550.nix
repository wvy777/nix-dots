{ config, ... }: {
  flake.modules.nixos.b550 = { pkgs, modulesPath, ... }: {
    imports = with config.flake.modules.nixos; [
      (modulesPath + "/installer/scan/not-detected.nix")

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

    home-manager.sharedModules = [
      {
        home.packages = with pkgs; [
          pwvucontrol
          overskride
        ];
      }
    ];

    boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" ];
    boot.kernelModules = [ "kvm-amd" ];

    nixpkgs.hostPlatform = pkgs.lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = pkgs.lib.mkDefault config.hardware.enableRedistributableFirmware;

    system.stateVersion = "26.05";
  };
}
