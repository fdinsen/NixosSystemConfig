{ lib, inputs, ... }:
{
  options.lib.hosts = lib.mkOption {
    type = lib.types.functionsOf lib.types.raw;
    default = { };
  };

  config.lib.hosts = {
    mkHost = inputs.nixpkgs.lib.nixosSystem {

    };
  };
}
