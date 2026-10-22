{ inputs, ...}: {
  nixos = { config, lib, user, ... }: {
    imports = [
      inputs.preservation.nixosModules.default
    ];

    options.custom.persist = {
      root = {
        directories = lib.mkOption {
          type = with lib.types; listOf anything;
          default = [];
        };
        files = lib.mkOption {
          type = with lib.types; listOf anything;
          default = [];
        };
      };

      home = {
        directories = lib.mkOption {
          type = with lib.types; listOf anything;
          default = [];
        };
        files = lib.mkOption {
          type = with lib.types; listOf anything;
          default = [];
        };
      };
    };

    config = let
      cfg = config.custom.persist;
    in {
      preservation = {
        enable = true;

        preserveAt."/persistent" = {
          commonMountOptions = [ "x-gvfs-hide" ];

          directories = [
            "/var/log"
            "/var/lib/nixos"
          ] ++ cfg.root.directories;
          inherit (cfg.root) files;

          users.${user} = {
            directories =  [
              ".ssh"
              ".local/share/Trash"
              "Documents"
              "Downloads"
              "Pictures"
              "Videos"
              "Projects"
            ] ++ cfg.home.directories;
            inherit (cfg.home) files;
          };
        };
      };

      fileSystems."/nix".neededForBoot = true;
      fileSystems."/persistent".neededForBoot = true;

      disko.devices = {
        nodev."/" = {
          fsType = "tmpfs";
          mountOptions = [
            "defaults"
            "size=256M"
            "mode=755"
          ];
        };

        disk.main = {
          device = "/dev/nvme0n1";
          type = "disk";

          content = {
            type = "gpt";
            partitions = {
              boot = {
                name = "boot";
                size = "1M";
                type = "EF02";
              };

              esp = {
                name = "ESP";
                size = "1G";
                type = "EF00";

                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                  mountOptions = [
                    "umask=0077"
                  ];
                };
              };

              swap = {
                name = "swap";
                size = "4G";

                content = {
                  type = "swap";
                  resumeDevice = true;
                };
              };

              root = {
                name = "root";
                size = "100%";

                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ];

                  subvolumes = {
                    "/nix" = {
                      mountpoint = "/nix";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                      ];
                    };

                    "/persistent" = {
                      mountpoint = "/persistent";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
