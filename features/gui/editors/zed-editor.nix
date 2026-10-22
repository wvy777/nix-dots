{
  home = {
    programs.zed-editor = {
      enable = true;
      extensions = [
        "nix"
        "base16"
        "material-icon-theme"
        "neocmake"
        "just"
        "toml"
        "git-firefly"
        "zig"
        "typst"
        "svelte"
      ];

      userSettings = {
        load_direnv = "shell_hook";

        buffer_font_family = "JetBrainsMono Nerd Font";
        buffer_font_size = 16;
        buffer_font_features = {
          calt = true;
          zero = true;
        };
        ui_font_size = 18;

        theme = "Base16 Mountain";
        icon_theme = {
          mode = "dark";
          dark = "Material Icon Theme";
          light = "Material Icon Theme";
        };

        project_panel = {
          auto_fold_dirs = false;
          dock = "left";
        };

        show_whitespaces = "trailing";

        terminal = {
          font_family = "JetBrainsMono Nerd Font";
          font_features = {
            calt = true;
            zero = true;
          };
        };

        git = {
          inline_blame.enabled = false;
          enable_status = false;
        };

        lsp = {
          nil = {
            binary.path_lookup = true;
            settings = {
              diagnostics = {
                ignored = [
                  # "unused_binding"
                  "unused_with"
                ];
              };
            };
          };

          nixd = {
            binary.path_lookup = true;
          };

          clangd = {
            binary = {
              arguments = [
                "--clang-tidy"
                "--background-index"
                "--completion-style=detailed"
                "--query-driver=/nix/store/*/bin/g++"
                "--query-driver=/nix/store/*/bin/gcc"
              ];
            };
          };

          rust-analyzer = {
            binary.path_lookup = true;
          };

          zls = {
            binary.path_lookup = true;
          };

          tinymist = {
            binary.path_lookup = true;
            initialization_options = {
              preview.background.enabled = true;
            };
          };
        };

        languages = {
          Nix = {
            format_on_save = "off";
          };
        };

        agent = {
          default_model = {
            provider = "copilot_chat";
            model = "gpt-5.2-codex";
          };
        };

        edit_predictions = {
          provider = "copilot";
        };

        telemetry = {
          diagnostics = false;
          metrics = false;
        };
      };
    };
  };

  nixos = {
    custom.persist = {
      home.directories = [
        ".local/share/zed"
      ];
    };
  };
}
