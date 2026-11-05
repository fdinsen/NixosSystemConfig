{
  self,
  config,
  lib,
  ...
}:
{
  home.nixvim.langs.default = {
    imports = with config.home.nixvim.langs; [
      nix-nixd
      rust
      python
    ];
  };
}
