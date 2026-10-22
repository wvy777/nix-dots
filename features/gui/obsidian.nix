{ config, ... }: {
  home = { pkgs, ... }: let
    system = pkgs.stdenv.hostPlatform.system;
  in {
    programs.obsidian = {
      enable = true;
      vaults = {
        "Main".target = "/Obsidian/Main";
      };

      defaultSettings = {
        app = {
          "alwaysUpdateLinks" = true;
          "showUnsupportedFiles" = true;
          "promptDelete" = false;
          "trashOption" = "local";
          "spellcheck" = false;
        };

        appearance = {
          "cssTheme" = "Minimal";
          "accentColor" = "#E87fA0";
          "baseFontSize" = 22;
          "interfaceFontFamily" = "Inter";
          "textFontFamily" = "Inter";
          "monospaceFontFamily" = "JetBrainsMono Nerd Font Mono";
        };

        themes = [
          { pkg = config.flake.packages.${system}.obsidian-minimal-theme; }
        ];

        corePlugins = [
          { name = "command-palette"; }
          { name = "switcher"; }
          { name = "file-explorer"; }
          { name = "graph"; }
          { name = "global-search"; }
          { name = "tag-pane"; }
          { name = "file-recovery"; }
          { name = "graph"; }
          { name = "outgoing-link"; }
          { name = "canvas"; }
          { name = "backlink"; }
          { name = "page-preview"; }
          { name = "word-count"; }
          { name = "webviewer"; }
          { name = "properties";}
        ];

        communityPlugins = [
          {
            pkg = config.flake.packages.${system}.obsidian-minimal-settings;
            settings = {
              "textSmall" = 16;
            };
          }
          {
            pkg = config.flake.packages.${system}.obsidian-iconic;
            settings = {
              "showAllFileIcons" = true;
              "showAllFolderIcons" = true;
              "maxBackups" = 0;
              "fileRules" = [
                {
                  "name" = "Typst";
                  "enabled" = true;
                  "icon" = "typst-stroke";
                  "match" = "all";
                  "conditions" = [
                    {
                      "source" = "extension";
                      "operator" = "is";
                      "value" = "typ";
                    }
                  ];
                }
                {
                  "name" = "Todo";
                  "enabled" = true;
                  "icon" = "lucide-check-circle";
                  "match" = "all";
                  "conditions" = [
                    {
                      "source" = "name";
                      "operator" = "contains";
                      "value" = "todo";
                    }
                  ];
                }
                {
                  "name" = "Reference";
                  "enabled" = true;
                  "icon" = "lucide-link";
                  "match" = "any";
                  "conditions" = [
                    {
                      "source" = "name";
                      "operator" = "contains";
                      "value" = "reference";
                    }
                    {
                      "source" = "name";
                      "operator" = "contains";
                      "value" = "resource";
                    }
                    {
                      "source" = "name";
                      "operator" = "contains";
                      "value" = "link";
                    }
                  ];
                }
              ];
            };
          }
          {
            pkg = config.flake.packages.${system}.obsidian-codeblock-customizer;
            settings = {
              "pluginSettings" = {
                "header" = {
                  "alwaysDisplayCodeblockLang" = true;
                  "displayCodeBlockIcon" = false;
                };
                "codeblock" = {
                  "usePrismHighlight" = true;
                  "hideFenceLines" = true;
                };
              };
            };
          }
          {
            pkg = config.flake.packages.${system}.obsidian-calendar;
            settings = {
              "showWeeklyNote" = true;
            };
          }
          {
            pkg = config.flake.packages.${system}.obsidian-periodic-notes;
            settings = {
              "showGettingStartedBanner" = false;
              "daily" = {
                "enabled" = true;
                "folder" = "Scratchpad/Daily";
              };
              "weekly" = {
                "enabled" = true;
                "folder" = "Scratchpad/Weekly";
              };
            };
          }
          { pkg = config.flake.packages.${system}.obsidian-git; }
          { pkg = config.flake.packages.${system}.obsidian-typst-mate; }
          { pkg = config.flake.packages.${system}.obsidian-no-more-flickering-inline-math; }
          { pkg = config.flake.packages.${system}.obsidian-tag-wrangler; }
          { pkg = config.flake.packages.${system}.obsidian-color-folders-files; }
        ];
      };
    };
  };

  nixos = {
    custom.persist = {
      home.directories = [
        "Obsidian"
        ".config/obsidian"
      ];
    };
  };
}
