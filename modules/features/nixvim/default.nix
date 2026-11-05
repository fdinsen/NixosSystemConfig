{ lib, config, ... }:
{
  options.nixos.nixvim = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };
  options.home.nixvim = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };

  config.nixos.nixvim.default =
    { ... }:
    {
    };

  config.home.nixvim.default =
    { ... }:
    {
      imports = with config.home.nixvim; [
        base
        keymaps
      ];
    };
}
