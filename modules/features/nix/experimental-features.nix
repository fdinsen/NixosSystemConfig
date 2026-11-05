{ ... }:
{
  nixos.nix.experimental-features = { ... }: {
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
      "pipe-operators"
    ];
  };
}
