{ config, ... }: {
  flake.modules.homeManager.ddnet = { pkgs, lib, ... }: {
    home.packages = with pkgs; [
      taterclient-ddnet
    ];

    home.activation = {
      ddnetFiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        ddnet_dir="$HOME/.local/share/ddnet"

        $DRY_RUN_CMD mkdir -p "$ddnet_dir"

        if [[ ! -e "$ddnet_dir/settings_ddnet.cfg" ]]; then
          $DRY_RUN_CMD cp ${./settings_ddnet.cfg} "$ddnet_dir/settings_ddnet.cfg"
        fi

        if [[ ! -e "$ddnet_dir/settings_tclient.cfg" ]]; then
          $DRY_RUN_CMD cp ${./settings_tclient.cfg} "$ddnet_dir/settings_tclient.cfg"
        fi

        $DRY_RUN_CMD mkdir -p "$ddnet_dir/assets"
        $DRY_RUN_CMD cp -r --no-preserve=mode ${./assets}/* "$ddnet_dir/assets/"

        $DRY_RUN_CMD mkdir -p "$ddnet_dir/skins"
        $DRY_RUN_CMD cp -r --no-preserve=mode ${./skins}/* "$ddnet_dir/skins"
      '';
    };
  };

  flake.modules.nixos.ddnet = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      ddnet
    ];

    custom.persist = {
      home.directories = [
        ".local/share/ddnet"
      ];
    };
  };

  flake.modules.darwin.ddnet = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      ddnet
    ];
  };
}
