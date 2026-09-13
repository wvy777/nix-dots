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

      # v6.5.29
      github-dark_user_css = pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/StylishThemes/GitHub-Dark/cee30ae0f344e449f9114f4dc35c74942852b460/github-dark.user.css";
        hash = "sha256-L2kSdeD73nc3BznKtH2+5/nuai8KX8EDVseJCoTn9VI=";
      };
    in {
      dbInChromeStorage = true;
      "style-1" = builtins.elemAt styles 0 // {
        sourceCode = builtins.readFile github-dark_user_css;
      };
    };
  };
}
