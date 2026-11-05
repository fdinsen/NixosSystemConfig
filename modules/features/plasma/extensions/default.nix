{ lib, ... }:
{
  options.nixos.plasma.extensions = lib.mkOption {
    default = { };
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };
  options.home.plasma.extensions = lib.mkOption {
    default = { };
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };
}
