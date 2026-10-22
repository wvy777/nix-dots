{
  home = { user, ... }: {
    programs.nh = {
      enable = true;
      osFlake = /home/${user}/Projects/nix-dots;
      darwinFlake = /Users/${user}/Projects/nix-dots;

      clean = {
        enable = true;
        dates = "weekly";
        extraArgs = "--keep 5 --keep-since 7d --optimise";
      };
    };
  };
}
