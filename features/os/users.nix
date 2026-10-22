{
  nixos = { user, ... }: {
    users.mutableUsers = false;

    users.users."root" = {
      initialPassword = "12345";
    };

    users.users.${user} = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" ];
      initialPassword = "12345";
    };
  };

  darwin = { user, ... }: {
    users.users.${user} = {
      home = /Users/${user};
    };

    system.primaryUser = user;
  };
}
