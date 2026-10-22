{
  home = { pkgs, ... }: {
    programs.bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [ batman ];

      config = {
        style = "grid,numbers";
      };
    };
  };
}
