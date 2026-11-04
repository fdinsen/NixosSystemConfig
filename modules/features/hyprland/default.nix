{ lib, ... }:
{
  options.nixos.hyprland = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };
}
