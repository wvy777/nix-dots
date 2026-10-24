{ pkgs }: let
  system = pkgs.stdenv.hostPlatform.system;
in {
  force = true;
  default = "ddg";
  engines = {
    "GitHub (code)" = {
      urls = [ { template = "https://github.com/search?q={searchTerms}&type=code"; } ];
      icon = "https://github.githubassets.com/favicons/favicon-dark.png";
      definedAliases = [ "@ghc" ];
    };

    "GitHub (repository)" = {
      urls = [ { template = "https://github.com/search?q={searchTerms}&type=repository"; } ];
      icon = "https://github.githubassets.com/favicons/favicon-dark.png";
      definedAliases = [ "@ghr" ];
    };

    "Nixpkgs" = {
      urls = [ { template = "https://search.nixos.org/packages?query={searchTerms}&channel=unstable"; } ];
      icon = "https://search.nixos.org/images/nixos-logomark-default-gradient-none.svg";
      definedAliases = [ "@np" ];
    };

    "Hydra" = {
      urls = [ { template = "https://hydra.nixos.org/job/nixpkgs/unstable/{searchTerms}.${system}"; } ];
      icon = "https://search.nixos.org/images/nixos-logomark-default-gradient-none.svg";
      definedAliases = [ "@hy" "@hydra" ];
    };

    "NixOS Options" = {
      urls = [ { template = "https://search.nixos.org/options?query={searchTerms}&channel=unstable"; } ];
      icon = "https://search.nixos.org/images/nixos-logomark-default-gradient-none.svg";
      definedAliases = [ "@no" ];
    };

    "Nix Darwin Options" = {
      urls = [ { template = "https://nixsearch.thekoppe.com/darwin?q={searchTerms}"; } ];
      icon = "https://github.com/user-attachments/assets/0e1a77ac-6739-4153-bd24-abd3a5e143f5";
      definedAliases = [ "@nd" ];
    };

    "Home Manager Options" = {
      urls = [ { template = "https://home-manager-options.extranix.com/?query={searchTerms}&release=master"; } ];
      icon = "https://home-manager.dev/favicon.ico";
      definedAliases = [ "@hm" ];
    };

    "NixOS Wiki" = {
      urls = [ { template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; } ];
      icon = "https://wiki.nixos.org/favicon.ico";
      definedAliases = [ "@nw" ];
    };

    "Noogle" = {
      urls = [ { template = "https://noogle.dev/q/?term={searchTerms}"; } ];
      icon = "https://noogle.dev/favicon.png";
      definedAliases = [ "@ng" ];
    };

    "Arch Wiki" = {
      urls = [ { template = "https://wiki.archlinux.org/index.php?search={searchTerms}"; } ];
      icon = "https://wiki.archlinux.org/favicon.ico";
      definedAliases = [ "@aw" ];
    };

    "Word Hippo (synonym)" = {
      urls = [ { template = "https://www.wordhippo.com/what-is/another-word-for/{searchTerms}.html"; } ];
      icon = "https://archive.wordhippo.com/what-is/img/desktop-index/index_hippo_logo.svg";
      definedAliases = [ "@whs" ];
    };

    "Akakçe" = {
      urls = [ { template = "https://www.akakce.com/arama/?q={searchTerms}"; } ];
      icon = "https://www.akakce.com/favicon.ico";
      definedAliases = [ "@ak" "@akakce" ];
    };

    "bing".metaData.hidden = true;
    "perplexity".metaData.hidden = true;
  };
}
