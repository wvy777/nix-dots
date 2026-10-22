{
  home = { lib, host, user, ... }: {
    programs.fastfetch = {
      enable = true;

      settings = {
        logo = {
          type = "none";
        };

        display = {
          separator = " ";
          color = "90";
          size = {
            binaryPrefix = "jedec";
          };
          bar = {
            char = {
              elapsed = "󰝤";
              total = "󰝤";
            };
            width = 12;
          };
          percent = {
            type = [
              "num"
              "num-color"
              "bar"
            ];
          };
        };

        modules = let
          content-width = (builtins.stringLength (user + host));
          extension = lib.concatStrings (lib.replicate (content-width - 7) "─");
        in [
          {
            key = "╭────────────${extension}╮";
            type = "custom";
          }
          {
            type = "title";
            format = "{#keys}│ {#34} {#37}{#1}${user}@${host}{#} {#keys}│";
          }
          {
            key = "├───────────┬${extension}╯";
            type = "custom";
          }
          {
            key = "│ {#34} {#37}distro  {#keys}│";
            type = "os";
          }
          {
            key = "│ {#34} {#37}wm      {#keys}│";
            type = "wm";
          }
          {
            key = "│ {#34} {#37}cpu     {#keys}│";
            type = "cpu";
            temp = true;
            format = "{name} [{cores-physical}C/{cores-logical}T] @ {freq-max} - {temperature}";
          }
          {
            key = "│ {#34} {#37}gpu     {#keys}│";
            type = "gpu";
            temp = true;
            driverSpecific = true;
            format = "{name} - {temperature}";
          }
          {
            key = "│ {#34} {#37}disk    {#keys}│";
            type = "disk";
            folders = "/";
            format = "{size-used} / {size-total} {size-percentage-bar} - {size-percentage}";
          }
          {
            key = "│ {#34} {#37}memory  {#keys}│";
            type = "memory";
            format = "{used} / {total} {percentage-bar} - {percentage}";
          }
          {
            key = "├───────────┼──────────────────────╮";
            type = "custom";
          }
          {
            key = "│ {#34} {#37}colors  {#keys}│";
            type = "custom";
            format = "{#31}  {#32}  {#33}  {#34}  {#35}  {#36}  {#37}  {#keys}│";
          }
          {
            key = "╰───────────┴──────────────────────╯";
            type = "custom";
          }
        ];
      };
    };
  };
}
