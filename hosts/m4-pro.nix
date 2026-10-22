{ config, inputs, ... }: {
  flake.modules.darwin.m4-pro = { pkgs, ... }: {
    imports = with config.flake.modules.darwin; [
      gui_bundle
      os_bundle
      shell_bundle

      homebrew
      mas
      stylix
      neovim
      neovide
      equibop
    ];

    environment.systemPackages = with pkgs; [
      nix-prefetch
    ];

    # https://nix-darwin.github.io/nix-darwin/manual/index.html#opt-homebrew.enable
    homebrew.casks = [
      "proton-pass"
      "ente-auth"
      "excalidrawz"
      "aldente"
      "cloudflare-warp"
      "vorssaint"
    ];

    programs.mas.packages = {
      "TestFlight" = 899247664;
      "Xcode" = 497799835;
      "Whatsapp Messenger" = 310633997;
      "Infuse" = 1136220934;
    };

    nixpkgs.hostPlatform = "aarch64-darwin";

    # Set Git commit hash for darwin-version
    system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    system.stateVersion = 6;
  };
}
