{ ... }:
{
  nixos.networking.base = { ... }: {
    networking.networkmanager.enable = true;
  };
}
