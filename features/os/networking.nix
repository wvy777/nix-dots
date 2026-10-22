let
  sharedConfig = { host, ... }: {
    networking.hostName = host;
  };
in {
  nixos = {
    imports = [ sharedConfig ];
  };

  darwin = {
    imports = [ sharedConfig ];
  };
}
