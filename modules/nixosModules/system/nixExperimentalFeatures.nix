{ ... }:
{
  flake.nixosModules.nixExperimentalFeatures = { ... }: {
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
      "pipe-operators"
    ];
  };
}
