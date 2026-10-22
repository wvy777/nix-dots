{ config, inputs }: path: let
  feature = let
    imported = import path;
  in if builtins.isFunction imported then
    imported { inherit config inputs; }
  else
    imported;

  name =
    feature.name or
    (builtins.replaceStrings [ ".nix" ] [ "" ] (baseNameOf path));
in {
  flake.modules.nixos.${name} = {
    imports = [ (feature.nixos or {}) ];
    home-manager.sharedModules = [
      (feature.home or {})
      (feature.nixos_home or {})
    ];
  };

  flake.modules.darwin.${name} = {
    imports = [ (feature.darwin or {}) ];
    home-manager.sharedModules = [
      (feature.home or {})
      (feature.darwin_home or {})
    ];
  };
}
