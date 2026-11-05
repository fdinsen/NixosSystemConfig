{ config, lib, ... }:
{
  options.home.hyprland.plugins = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };

  config.home.hyprland.plugins.default = { ... }: {
    imports = with config.home.hyprland.plugins; [
      hyprglass
    ];
  };
}
