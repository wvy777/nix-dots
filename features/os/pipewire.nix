{
  nixos = {
    # https://wiki.nixos.org/wiki/PipeWire#Configuring_PipeWire

    # rtkit allows Pipewire to use the realtime scheduler for increased performance
    security.rtkit.enable = true;

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;

      # If you want to use JACK applications, uncomment the following
      # jack.enable = true;
    };

    custom.persist = {
      home.directories = [
        ".local/state/wireplumber"
      ];
    };
  };
}
