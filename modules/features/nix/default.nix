{ config, lib, ... }:
{
  options.nixos.nix = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };
  options.home.nix = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };

  config.nixos.nix.default = {
    imports = with config.nixos.nix; [
      unfree
      experimental-features
      home-manager
    ];
  };
}
