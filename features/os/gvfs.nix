{
  nixos = {
    # https://wiki.nixos.org/wiki/Nautilus#Mount,_trash,_and_other_virtual_filesystems
    services.gvfs.enable = true;
  };
}
