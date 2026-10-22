{
  nixos = {
    programs.localsend = {
      enable = true;
      openFirewall = true;
    };

    custom.persist = {
      home.directories = [
        ".local/share/org.localsend.localsend_app"
      ];
    };
  };

  darwin = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      localsend
    ];
  };
}
