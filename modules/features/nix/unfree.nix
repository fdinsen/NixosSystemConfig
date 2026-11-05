{ ... }:
{
  nixos.nix.unfree = { ... }: {
    nixpkgs.config.allowUnfree = true;
  };
}
