{
  config,
  lib,
  ...
}:
{
  options.nixos.default = lib.mkOption {
    type = lib.types.deferredModule;
    default = { };
  };
  options.home.default = lib.mkOption {
    type = lib.types.deferredModule;
    default = { };
  };
  config.nixos.default = {
    imports = with config.nixos; [
      boot.default
      nix.default
      system.default
      networking.default

      plasma.default
      virtualisation.default
      dev.default

      desktop.default
    ];
  };

  config.home.default = {
    imports = with config.home; [
      nixvim.default
      plasma.default
      dev.default
      desktop.default
    ];
  };

  config.flake.nixosModules.default = config.nixos.default;
  config.flake.homeModules.default = config.home.default;
}
