{ lib, config, ... }:
{
  options.nixos.desktop = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };
  options.home.desktop = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };

  config.nixos.desktop.default = {
    imports = with config.nixos.desktop; [
      browser
    ];
  };
  config.home.desktop.default = {
    imports = with config.home.desktop; [
      rofi
      browser
    ];
  };

  config.flake.nixosModules.desktop.default = config.nixos.desktop.default;
  config.flake.homeModules.desktop.default = config.home.desktop.default;
}
