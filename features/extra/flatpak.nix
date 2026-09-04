{ inputs, ... }: {
  flake.modules.nixos.flatpak = {
    imports = [
      inputs.nix-flatpak.nixosModules.nix-flatpak
    ];

    services.flatpak = {
      enable = true;
    };

    custom.persist = {
      root.directories = [
        "/var/lib/flatpak"
      ];
      home.directories = [
        ".var/app"
        ".local/share/flatpak"
      ];
    };
  };
}
