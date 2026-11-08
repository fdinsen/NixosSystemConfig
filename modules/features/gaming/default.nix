{ lib, ... }:
{
  options.nixos.gaming = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };
  options.home.gaming = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };
}
