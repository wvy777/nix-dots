{
  home = {
    programs.git = {
      enable = true;

      # https://wiki.nixos.org/wiki/Git#Using_your_public_SSH_key_as_a_signing_key
      signing = {
        key = "~/.ssh/id_ed25519.pub";
        signByDefault = true;
      };

      settings = {
        user.name = "wvy777";
        user.email = "105508453+wvy777@users.noreply.github.com";

        init.defaultBranch = "main";
        gpg.format = "ssh";
      };
    };
  };
}
