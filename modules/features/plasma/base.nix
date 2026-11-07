{ lib, config, ... }:
{
  options.nixos.plasma.base = lib.mkOption {
    default = { };
    type = lib.types.deferredModule;
  };
  options.home.plasma.base = lib.mkOption {
    default = { };
    type = lib.types.deferredModule;
  };

  config.nixos.plasma.base = {
    services.desktopManager.plasma6.enable = true;
  };

  config.home.plasma.base = { pkgs, ... }: {
    imports = [
      config.home.plasma.panels.base
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
