{ lib, config, ... }:
{
  options.nixos.system = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };
  options.home.system = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };

  config.nixos.system.default = {
    imports = with config.nixos.system; [
      audio
      fonts
      keyboard
      locale
      printing
    ];
  };

  config.flake.nixosModules.system = config.nixos.system.default;
}
