{ inputs, config, ... }: {
  flake.modules.homeManager.niri = {
    imports = [
      inputs.niri-nix.homeModules.default
      inputs.niri-nix.homeModules.stylix
      ./_settings.nix
      ./_binds.nix
    ];

    wayland.windowManager.niri = {
      enable = true;
    };
  };

  flake.modules.nixos.niri = { pkgs, ... }: {
    imports = [
      inputs.niri-nix.nixosModules.default
    ];

    nix.settings = {
      substituters = [
        "https://niri-nix.cachix.org"
      ];
      trusted-public-keys = [
        "niri-nix.cachix.org-1:SvFtqpDcf7Sm1SMJdby1/+Y+6f3Yt3/3PMcSTKPJNJ0="
      ];
    };

    environment.systemPackages = with pkgs; [
      xwayland-satellite
      nautilus
    ];

    programs.niri = {
      enable = true;
      withUWSM = true;
    };

    home-manager.sharedModules = with config.flake.modules.homeManager; [
      niri
    ];
  };
}
