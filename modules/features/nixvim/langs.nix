{ self, lib, ... }:
{
  config.flake.homeModules."nixvim.langs" =
    { config, ... }:
    {
      imports = [
        self.nixvimLangs.java
        self.nixvimLangs.nix-nixd
        self.nixvimLangs.nix-nil
        self.nixvimLangs.rust
        self.nixvimLangs.haskell
        self.nixvimLangs.idris2
        self.nixvimLangs.rocq
        self.nixvimLangs.scala
        self.nixvimLangs.python
        self.nixvimLangs.ts
        self.nixvimLangs.go
      ];
    };
  options.flake.nixvimLangs = lib.mkOption {
    type = lib.types.submodule {
      freeformType = lib.types.lazyAttrsOf lib.types.raw;
    };
    default = { };
    description = "Nixvim langs modules, collected and merged across the module tree.";
  };
}
