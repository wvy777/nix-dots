let
  sharedConfig = {
    security.sudo = {
      extraConfig = ''
        Defaults lecture=never
        Defaults pwfeedback
      '';
    };
  };
in {
  nixos = {
    imports = [ sharedConfig ];

    security.sudo.enable = true;
  };

  darwin = {
    imports = [ sharedConfig ];
  };
}
