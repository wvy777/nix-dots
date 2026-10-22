{
  nixos = {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };

    custom.persist = {
      home.directories = [
        ".local/share/applications"
        ".local/share/icons/hicolor"
        ".local/share/Steam"

        ".local/share/Terraria"
      ];
    };
  };
}
