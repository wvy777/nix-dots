{ config, ... }: {
  nixos.imports = with config.flake.modules.nixos; [
    bat
    direnv
    fastfetch
    fzf
    git
    lazygit
    nh
    nix
    starship
    sudo
    zoxide
    zsh
  ];

  darwin.imports = with config.flake.modules.darwin; [
    bat
    direnv
    fastfetch
    fzf
    git
    lazygit
    nh
    nix
    starship
    sudo
    zoxide
    zsh
  ];
}
