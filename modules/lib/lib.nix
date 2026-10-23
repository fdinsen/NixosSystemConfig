{ lib, ... }:
{
  options.flake.lib = lib.mkOption {
    type = lib.types.submodule {
      freeformType = lib.types.lazyAttrsOf lib.types.raw;
    };
    default = { };
    description = "Shared library functions and data, merged from across the module tree.";
  };
}
