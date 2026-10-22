{
  nixos = {
    # https://nixos.wiki/wiki/Bluetooth#Enabling_Bluetooth_support
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;

    custom.persist = {
      root.directories = [
        "/var/lib/bluetooth"
      ];
    };
  };
}
