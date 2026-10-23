{ lib, ... }:
{
  options.flake.lib.assets = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.raw;
    default = {};
    description = "Shared library of assets, merged from across the modules tree.";
  };
}
