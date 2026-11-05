{ lib, ... }:
{
  options.nixos.hosts = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };
  options.home.hosts = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };
}
