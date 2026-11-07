{ lib, ... }:
{
  options.home.plasma.panels = lib.mkOption {
    default = { };
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };

  options.nixos.plasma.panels = lib.mkOption {
    default = { };
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };
}
