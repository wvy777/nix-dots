{
  home = { lib, ... }: {
    programs.neovide = {
      enable = true;
      settings = {
        font = {
          size = lib.mkForce 18;
          features."JetBrainsMono Nerd Font" = [ "+zero" ];
        };
      };
    };
  };
}
