{ inputs, ... }: {
  home = { pkgs, ... }: {
    programs.firefox = {
      enable = true;

      policies = import ./shared/_policies.nix;

      profiles."default" = {
        name = "default";
        id = 0;
        isDefault = true;

        extensions = import ./shared/_extensions.nix { inherit pkgs inputs; };
        settings = import ./shared/_settings.nix;
        search = import ./shared/_search.nix;
        bookmarks = import ./shared/_bookmarks.nix;
      };
    };
  };
}
