{
  nixos = {
    # https://wiki.nixos.org/wiki/Systemd/boot#Usage
    boot.loader.systemd-boot.enable = true;
    boot.loader.systemd-boot.configurationLimit = 10;

    # Whether the installation process is allowed to modify EFI boot variables
    boot.loader.efi.canTouchEfiVariables = true;
  };
}
