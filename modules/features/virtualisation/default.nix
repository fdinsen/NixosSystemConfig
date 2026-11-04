{ config, lib, ... }:
{
  options.nixos.virtualisation = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };

  config.nixos.virtualisation.default = {
    imports = with config.nixos.virtualisation; [
      docker
    ];
  };
}
