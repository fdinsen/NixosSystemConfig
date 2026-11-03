{
  lib,
  config,
  self,
  ...
}:
{
  options.nixos.plasma.base = lib.mkOption {
    default = { };
    type = lib.types.deferredModule;
  };
  options.home.plasma.base = lib.mkOption {
    default = { };
    type = lib.types.deferredModule;
  };

  config.nixos.plasma.base =
    { ... }:
    {
      imports = with config.nixos.plasma; [
        themes.sweet

        lockscreen
      ];
      services.desktopManager.plasma6.enable = true;
    };

  config.home.plasma.base =
    { pkgs, ... }:
    {
      imports = with config.home.plasma; [
        themes.sweet

        lockscreen

        panels.base

        input.logitechG502

        extensions.alt-tab-box
        extensions.dialog-flyout
        extensions.geometry-change
        extensions.move-resize-translucency
        extensions.round-corners
        extensions.tiling-wm
        extensions.virtual-desktops
        extensions.window-blur
      ];

      home.packages = [
        pkgs.tela-icon-theme
      ];

      programs.plasma = {
        enable = true;

        powerdevil.AC.autoSuspend.action = "nothing";
        powerdevil.AC.turnOffDisplay.idleTimeout = "never";
      };
    };
}
