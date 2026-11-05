{ ... }:
{
  nixos.boot.linux-kernel-latest = { pkgs, ... }: {
    boot.kernelPackages = pkgs.linuxPackages_latest;
  };
}
