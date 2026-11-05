{ config, lib, ... }:
{
  options.nixos.networking = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };

  config.nixos.networking.default = {
    imports = with config.nixos.networking; [
      base
      ca-blacklist
    ];
  };

  config.flake.nixosModules.networking = config.nixos.networking.default;
}
