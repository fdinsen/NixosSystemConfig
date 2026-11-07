{ lib, ... }:
{
  options.home.plasma.widgets = lib.mkOption {
    default = { };
    type = lib.types.deferredModule;
  };

  config.home.plasma.widgets = {
    options.plasma-widgets = lib.mkOption {
      default = { };
      type = lib.types.lazyAttrsOf lib.types.raw;
    };
  };
}
