{
  flake.modules.darwin.m4-pro = { pkgs, user, ... }: {
    home-manager.users.${user} = {
      home = {
        packages = with pkgs; [
          nix-prefetch
        ];
      };
    };
  };
}
