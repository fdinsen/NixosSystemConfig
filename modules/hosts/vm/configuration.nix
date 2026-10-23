{ ... }:
{
  flake.nixosModules.fdinsen-vm-config = { config, pkgs, ... }: {
    users.users.fdinsen-vm = {
      isNormalUser = true;
      password = "test";
      extraGroups = [ "wheel" ];
    };

    system.stateVersion = "25.11";

    virtualisation.vmVariant = {
      virtualisation.memorySize = 4096;
      virtualisation.cores = 2;
      virtualisation.qemu.options = [ "-vga virtio" ];
    };
  };
}
