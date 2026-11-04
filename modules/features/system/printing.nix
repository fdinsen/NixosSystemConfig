{ ... }:
{
  nixos.system.printing = { ... }: {
    services.printing.enable = true;
  };
}
