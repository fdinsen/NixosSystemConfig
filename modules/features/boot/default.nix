{ lib, config, ... }:
{
  options.nixos.boot = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };

  config.nixos.boot.default = {
    imports = with config.nixos.boot; [
      bootloader
    ];
  };

  config.flake.nixosModules.boot = config.nixos.boot.default;
}
