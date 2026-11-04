{ config, lib, ... }:
{
  options.nixos.dev = lib.mkOption {
    default = { };
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };
  options.home.dev = lib.mkOption {
    default = { };
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };

  config.nixos.dev.default = {
    imports = with config.nixos.dev; [
      git
      lazygit
    ];
  };
}
