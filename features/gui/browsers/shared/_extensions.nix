{ pkgs, inputs, ...}: let
  system = pkgs.stdenv.hostPlatform.system;
in {
  force = true;
  packages = with inputs.nur.legacyPackages.${system}.repos.rycee.firefox-addons; [
    clearurls
    istilldontcareaboutcookies
    material-icons-for-github
    privacy-badger
    proton-pass
    return-youtube-dislikes
    sponsorblock
    terms-of-service-didnt-read
    ublock-origin
    unpaywall
    videospeed
    violentmonkey
    wayback-machine
    windscribe
    stylus
  ];

  settings = {
    # Stylus
    "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}".settings = let
      styles = builtins.fromJSON (builtins.readFile ./styles.json);

      github-dark_user_css = pkgs.fetchurl {
        url = "https://github.com/StylishThemes/GitHub-Dark/blob/cf7a31bb72bee1b75fdc6578219ff7c9b07161f2/github-dark.user.css";
        hash = "sha256-jpkK+34mGhkXG1mgW3k14+QFpyaVYZAziwFHX+RX6Tg=";
      };
    in {
      dbInChromeStorage = true;
      "style-1" = builtins.elemAt styles 0 // {
        sourceCode = builtins.readFile github-dark_user_css;
      };
    };
  };
}
