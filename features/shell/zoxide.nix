{
  home = {
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [ "--cmd cd" ];
    };
  };

  nixos = {
    custom.persist = {
      home.directories = [
        ".local/share/zoxide"
      ];
    };
  };
}
