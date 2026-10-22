{ config, ... }: {
  home = { pkgs, ... }: let
    system = pkgs.stdenv.hostPlatform.system;
  in {
    programs.vscode = {
      enable = true;
      profiles.default = {
        extensions = with pkgs.vscode-extensions; [
          # Theme
          config.flake.packages.${system}.vscode-moegi-theme
          pkief.material-icon-theme

          # Language Support
          jnoortheen.nix-ide
          rust-lang.rust-analyzer
          ziglang.vscode-zig
          ms-python.vscode-pylance
          ms-vscode.cpptools-extension-pack
          llvm-vs-code-extensions.vscode-clangd
          tamasfe.even-better-toml
          myriad-dreamin.tinymist

          # Quality of Life
          mkhl.direnv
          github.vscode-github-actions
          config.flake.packages.${system}.vscode-gutter-preview
        ];

        userSettings = {
          "update.mode" = "none";

          "workbench.colorTheme" = "Moegi Dark Vitesse";
          "workbench.iconTheme" = "material-icon-theme";

          "editor.tabSize" = 2;
          "editor.minimap.enabled" = false;
          "editor.fontFamily" = "JetBrainsMono Nerd Font";
          "editor.fontLigatures" = "'calt', 'zero'";

          "explorer.compactFolders" = false;

          "window.titleBarStyle" = "custom";

          "nix.enableLanguageServer" = true;
          "nix.serverPath" = "nil";
          "nix.serverSettings.nil" = {
            "diagnostics" = {
              "ignored" = [
                # "unused_binding"
                "unused_with"
              ];
            };
          };

          "C_Cpp.intelliSenseEngine" = "disabled";
          "C_Cpp.errorSquiggles" = "disabled";
          "clangd.arguments" = [
            "--clang-tidy"
            "--background-index"
            "--completion-style=detailed"
            "--query-driver=/nix/store/*/bin/g++"
            "--query-driver=/nix/store/*/bin/gcc"
          ];

          "zig.zls.enabled" = "on";
        };
      };
    };
  };

  nixos = {
    custom.persist = {
      home.directories = [
        ".vscode"
        ".config/Code"
      ];
    };
  };
}
