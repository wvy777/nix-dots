{
  home = {
    programs.ghostty = {
      enable = true;
      enableZshIntegration = true;

      settings = {
        window-padding-x = 14;
        window-padding-y = "0,6";
        macos-titlebar-style = "hidden";
        confirm-close-surface = false;
        font-feature = "+zero";
        font-size = 16;
      };
    };
  };

  darwin_home = { pkgs, ... }: {
    programs.ghostty.package = pkgs.ghostty-bin;
  };
}
