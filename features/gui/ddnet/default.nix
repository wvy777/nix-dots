{ config, ... }: {
  flake.modules.homeManager.ddnet = { pkgs, lib, ... }: {
    home.packages = with pkgs; [
      (taterclient-ddnet.overrideAttrs (old: {
        cmakeFlags = old.cmakeFlags ++ [
          (lib.cmakeBool "SERVER" true)
        ];

        # https://ddnet.org/settingscommands/#server-settings
        # https://github.com/ddnet/ddnet/blob/master/data/autoexec_server.cfg
        postInstall = old.postInstall + ''
          cp ${./myServerconfig.cfg} "$out/share/ddnet/data/myServerconfig.cfg"
        '';
      }))
    ];

    home.file = let
      ddnet_dir = ".local/share/ddnet";

      akka2 = pkgs.fetchurl {
        url = "https://teedata.net/databasev2/entities/akka2/akka2.png";
        hash = "sha256-t+7Ns73CSnHAxwSOJYCfRtmmKZbCUzNpVND2eOmkpos=";
      };

      kiri = pkgs.fetchurl {
        url = "https://teedata.net/databasev2/gameskins/kiri/kiri.png";
        hash = "sha256-p4eJvi4EL6VfoFY91MPwdp3SJkekz1vWFJZeZWA9tVc=";
      };

      schichimiya = pkgs.fetchurl {
        url = "https://teedata.net/databasev2/emoticons/schichimiya/schichimiya.png";
        hash = "sha256-aTP60Z0LrRLgQ3QwBpl9EKd7aqnyNRkqpci9uaBdmak=";
      };

      silhouette_particles = pkgs.fetchurl {
        url = "https://teedata.net/databasev2/particles/silhouette_particles/silhouette_particles.png";
        hash = "sha256-wVaUnEn43+Dm0HfoXrSb+dD8m8csCt/HRqHHKpFfkA4=";
      };
    in {
      "${ddnet_dir}/assets/entities/akka2.png".source = akka2;
      "${ddnet_dir}/assets/game/kiri.png".source = kiri;
      "${ddnet_dir}/assets/emoticons/schichimiya.png".source = schichimiya;
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

    networking.firewall.allowedUDPPortRanges = [
      { from =  8303; to = 8310; }
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
