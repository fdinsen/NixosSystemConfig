{ lib, ... }:
{
  options.home.plasma.input = lib.mkOption {
    default = { };
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };
}
