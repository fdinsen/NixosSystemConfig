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
  config.home.default = {
    imports = [
      config.home.nixvim.default
    ];

    home.stateVersion = "25.11";
  };
}
