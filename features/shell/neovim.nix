{ inputs, ... }: {
  home = {
    imports = [
      inputs.nix4nvchad.homeManagerModules.default
    ];

    programs.nvchad = {
      enable = true;

      extraConfig = ''
        vim.opt.shiftwidth = 2
        vim.opt.tabstop = 2
        vim.opt.expandtab = true
      '';

      chadrcConfig = ''
        local M = {}

        M.base46 = {
          theme = "mountain",
        }

        M.ui = {
          telescope = {
            style = "bordered",
          },

          tabufline = {
            enabled = false,
          },
        }

        return M
      '';
    };
  };

  nixos = {
    custom.persist = {
      home.directories = [
        ".local/share/nvim"
        ".local/state/nvim"
      ];
    };
  };
}
