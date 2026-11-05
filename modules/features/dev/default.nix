{ config, lib, ... }:
{
  options.nixos.dev = lib.mkOption {
    default = { };
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };
  options.home.dev = lib.mkOption {
    default = { };
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };

  config.nixos.dev.default = {
    imports = with config.nixos.dev; [
      git
      lazygit
      kitty
      zsh
      terminal
    ];
  };

  config.home.dev.default = {
    imports = with config.home.dev; [
      kitty
      zsh
      direnv
    ];
  };

  config.flake.nixosModules.dev = config.nixos.dev.default;
  config.flake.homeModules.dev = config.home.dev.default;
}
