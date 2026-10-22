{
  nixos_home = {
    services.linux-wallpaperengine = {
      enable = true;
      wallpapers = [
        {
          monitor = "DP-3";
          wallpaperId = "3772195227";
          fps = 30;
          audio = {
            silent = true;
            processing = false;
          };
        }
      ];
    };
  };

  darwin_home = {
    programs.desktoppr = {
      enable = true;
      settings = {
        picture = "https://w.wallhaven.cc/full/gw/wallhaven-gw2mel.png";
      };
    };
  };
}
