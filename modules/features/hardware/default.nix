{ lib, ... }:
{
  options.nixos.hardware = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };
  options.home.hardware = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };
}
