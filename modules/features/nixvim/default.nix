{ lib, config, ... }:
{
  options.nixos.nixvim = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };
  options.home.nixvim = lib.mkOption {
    type = lib.types.submodule {
      options = {
        default = lib.mkOption { type = lib.types.deferredModule; };
        base = lib.mkOption { type = lib.types.deferredModule; };

        lsp = lib.mkOption { type = lib.types.deferredModule; };
        keymaps = lib.mkOption { type = lib.types.deferredModule; };

        langs = lib.mkOption { type = lib.types.lazyAttrsOf lib.types.deferredModule; };
        colorschemes = lib.mkOption { type = lib.types.lazyAttrsOf lib.types.deferredModule; };
      };
    };
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
        lsp

        langs.default
        plugins.default
        colorschemes.everforest
      ];
    };

  config.flake.homeModules.nixvim = config.home.nixvim.default;
}
