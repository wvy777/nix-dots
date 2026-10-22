let
  sharedConfig = {
    time.timeZone = "Europe/Istanbul";
  };
in {
  nixos = {
    imports = [ sharedConfig ];

    i18n.defaultLocale = "en_US.UTF-8";
  };

  darwin = {
    imports = [ sharedConfig ];
  };
}
