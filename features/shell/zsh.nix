{
  home = { config, ... }: {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      history = {
        size = 5000;
        ignoreAllDups = true;
        path = "${config.xdg.dataHome}/zsh/zsh_history";
      };

      shellAliases = {
        ff = "fastfetch";
      };
    };
  };

  nixos = { pkgs, user, ... }: {
    programs.zsh.enable = true;
    users.users.${user}.shell = pkgs.zsh;

    custom.persist = {
      home.directories = [
        ".local/share/zsh"
      ];
    };
  };

  nixos_home = {
    programs.zsh.initContent = ''
      if uwsm check may-start; then
        exec uwsm start niri-uwsm.desktop
      fi
    '';
  };
}
