{ config, ... }: {
  nixos.imports = with config.flake.modules.nixos; [
    bluetooth
    gvfs
    i18n
    networking
    pipewire
    systemd-boot
    users
  ];

  darwin.imports = with config.flake.modules.darwin; [
    i18n
    macos
    networking
    users
  ];
}
