{
  lib,
  config,
  inputs,
  ...
}:
{
  options.nixos.plasma.default = lib.mkOption {
    default = { };
    type = lib.types.deferredModule;
  };
  options.home.plasma.default = lib.mkOption {
    default = { };
    type = lib.types.deferredModule;
  };

  config.nixos.plasma.default = {
    imports = with config.nixos.plasma; [
      base

      themes.sweet

      lockscreen

      panels.base
    ];
  };

  config.home.plasma.default = {
    imports = [
      inputs.plasma-manager.homeModules.plasma-manager
    ]
    ++ (with config.home.plasma; [
      base

      themes.sweet

      lockscreen

      extensions.alt-tab-box
      extensions.dialog-flyout
      extensions.geometry-change
      extensions.move-resize-translucency
      extensions.round-corners
      extensions.tiling-wm
      extensions.virtual-desktops
      extensions.window-blur
    ]);

  };

  config.flake.nixosModules.plasma = config.nixos.plasma.default;
  config.flake.homeModules.plasma = config.home.plasma.default;
}
