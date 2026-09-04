{ config, ... }: {
  flake.modules.homeManager.chromium = {
    programs.chromium = {
      enable = true;
      extensions = [
        { id = "edibdbjcniadpccecjdfdjjppcpchdlm"; } # I still don't care about cookies
        { id = "bggfcpfjbdkhfhfmkjpbhnkhnpjjeomc"; } # Material Icons for GitHub
        { id = "pkehgijcmpdhfbdbbnkijodmdjhbjlgp"; } # Privacy Badger
        { id = "ghmbeldphafepmbegfdlkpapadhbakde"; } # Proton Pass
        { id = "gebbhagfogifgggkldgodflihgfeippi"; } # Return YouTube Dislike
        { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # SponsorBlock
        { id = "hjdoplcnndgiblooccencgcggcoihigg"; } # Terms of Service; Didn’t Read
        { id = "ddkjiahejlhfcafbddmgiahcphecmpfh"; } # uBlock Origin Lite
        { id = "iplffkdpngmdjhlpjmppncnlhomiipha"; } # Unpaywall
        { id = "dffbjiomnajbmlhjelpipfldgkijdemn"; } # URL Cleaner
        { id = "nffaoalbilbmmfgbnbgppjihopabppdk"; } # Video Speed Controller
        { id = "hnmpcagpplmpfojmgmnngilcnanddlhb"; } # Windscribe VPN
        { id = "clngdbkpkpeebahjckkjfobafhncgmne"; } # Stylus
      ];

      commandLineArgs = [
        "--no-first-run"
        "--no-default-browser-check"
      ];
    };
  };

  flake.modules.nixos.chromium = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      chromium
    ];

    environment.etc = {
      "chromium/policies/managed/policies.json".text = builtins.toJSON {
        "AutofillAddressEnabled" = false;
        "AutofillCreditCardEnabled" = false;
        "BrowserSignin" = 0;
        "DefaultGeolocationSetting" = 2;
        "MetricsReportingEnabled" = false;
        "PasswordManagerEnabled" = false;
        "PasswordLeakDetectionEnabled" = false;
        "PromotionsEnabled" = false;
      };
    };

    custom.persist = {
      home.directories = [
        ".config/chromium"
        ".cache/chromium"
      ];
    };
  };

  flake.modules.darwin.chromium = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      chromium
    ];
  };
}
