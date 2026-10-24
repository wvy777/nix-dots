{ lib }: path: let
  inherit (lib) hasPrefix;
  inherit (lib.fileset) toList fileFilter;

  filter = file:
    file.hasExt "nix"
    && !hasPrefix "_" file.name;
in toList (fileFilter filter path)
