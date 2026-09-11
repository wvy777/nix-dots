{
  flake.modules.nixos.audiorelay = {
    services.flatpak.packages = [
      "net.audiorelay.AudioRelay"
    ];

    services.pipewire = {
      extraConfig.pipewire-pulse."99-audiorelay"."pulse.cmd" = [
        {
          cmd = "load-module";
          args = "module-null-sink sink_name=audiorelay-virtual-mic-sink sink_properties=device.description=Virtual-Mic-Sink";
        }
        {
          cmd = "load-module";
          args = "module-remap-source master=audiorelay-virtual-mic-sink.monitor source_name=audiorelay-virtual-mic-sink source_properties=device.description=Virtual-Mic";
        }
      ];
    };

    networking.firewall.allowedUDPPorts = [
      59100 # Audio transport
      59200 # Server discovery
    ];
  };

  flake.modules.darwin.audiorelay = {
    homebrew.casks = [
      "audiorelay"
    ];
  };
}
