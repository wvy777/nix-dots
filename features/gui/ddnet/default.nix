{ config, ... }: {
  flake.modules.homeManager.ddnet = { pkgs, lib, ... }: {
    home.packages = with pkgs; [
      taterclient-ddnet
    ];

    home.file = let
      ddnet_dir = ".local/share/ddnet";

      kir4i_contrast = pkgs.fetchurl {
        url = "https://skins.ddstats.tw/kir4i_contrast.png";
        hash = "sha256-qmmko+wrM0H7YMVU4/+z+EVHS7zBFPwGHXuTUt53YFI=";
      };

      kir4i_k = pkgs.fetchurl {
        url = "https://skins.ddstats.tw/kir4i_k.png";
        hash = "sha256-xWwkmXfjdciKTO9yyV6Mqfu677U2gj0Lq82UG6KQsqY=";
      };

      black_grey = pkgs.fetchurl {
        url = "https://teedata.net/databasev2/entities/black_grey/black_grey.png";
        hash = "sha256-ryJ11161ockZIIx2dUk053hDmDD45BMEIWyOZhCRj2Y=";
      };

      black_hud = pkgs.fetchurl {
        url = "https://teedata.net/databasev2/templates/black_hud/black_hud.png";
        hash = "sha256-rernFq5yfQpaj4KKHOaLJLbRX/A8ZlFSAC6KfQ0UOUU=";
      };

      kiri = pkgs.fetchurl {
        url = "https://teedata.net/databasev2/gameskins/kiri/kiri.png";
        hash = "sha256-p4eJvi4EL6VfoFY91MPwdp3SJkekz1vWFJZeZWA9tVc=";
      };

      silhouette_particles = pkgs.fetchurl {
        url = "https://teedata.net/databasev2/particles/silhouette_particles/silhouette_particles.png";
        hash = "sha256-wVaUnEn43+Dm0HfoXrSb+dD8m8csCt/HRqHHKpFfkA4=";
      };
    in {
      "${ddnet_dir}/skins/kir4i_contrast.png".source = kir4i_contrast;
      "${ddnet_dir}/skins/kir4i_k.png".source = kir4i_k;
      "${ddnet_dir}/assets/entities/black_grey.png".source = black_grey;
      "${ddnet_dir}/assets/hud/black_hud.png".source = black_hud;
      "${ddnet_dir}/assets/game/kiri.png".source = kiri;
      "${ddnet_dir}/assets/particles/silhouette_particles.png".source = silhouette_particles;
    };

    home.activation.ddnetSettings = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      ddnet_dir="$HOME/.local/share/ddnet"

      $DRY_RUN_CMD mkdir -p "$ddnet_dir"

      if [[ ! -e "$ddnet_dir/settings_ddnet.cfg" ]]; then
        $DRY_RUN_CMD cp ${./settings_ddnet.cfg} "$ddnet_dir/settings_ddnet.cfg"
      fi

      if [[ ! -e "$ddnet_dir/settings_tclient.cfg" ]]; then
        $DRY_RUN_CMD cp ${./settings_tclient.cfg} "$ddnet_dir/settings_tclient.cfg"
      fi
    '';
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
