{ lib, ... }:
{
  options.nixos.plasma.themes = lib.mkOption {
    default = { };
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };
  options.home.plasma.themes = lib.mkOption {
    default = { };
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };
}
