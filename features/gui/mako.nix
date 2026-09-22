{
  flake.modules.nixos.mako = {
    home-manager.sharedModules = [
      {
        services.mako = {
          enable = true;
          settings = {
            default-timeout = 4000;
            layer = "overlay";
            border-radius = 10;
            icon-border-radius = 10;
            padding = 8;
          };
        };
      }
    ];
  };
}
