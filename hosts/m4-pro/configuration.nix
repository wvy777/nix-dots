{ config, inputs, ... }: {
  flake.modules.darwin.m4-pro = {
    imports = with config.flake.modules.darwin; [
      gui_bundle
      os_bundle
      shell_bundle

      homebrew
      stylix
      neovim
      neovide
      equibop
    ];

    # https://nix-darwin.github.io/nix-darwin/manual/index.html#opt-homebrew.enable
    homebrew = {
      casks = [
        "proton-pass"
        "ente-auth"
        "excalidrawz"
        "aldente"
        "cloudflare-warp"
        "vorssaint"
      ];
      masApps = {
        "TestFlight" = 899247664;
        "Xcode" = 497799835;
        "Whatsapp Messenger" = 310633997;
      };
    };

    nixpkgs.hostPlatform = "aarch64-darwin";

    # Set Git commit hash for darwin-version
    system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    system.stateVersion = 6;
  };
}
