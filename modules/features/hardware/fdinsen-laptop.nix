{ config, ... }:
{
  nixos.hardware.fdinsen-laptop = {
    imports = with config.nixos.hardware; [
      fingerprint-login
    ];

    boot.initrd.luks.devices."luks-3dfcc475-c659-4a1a-afef-5091bd4781f7".device =
      "/dev/disk/by-uuid/3dfcc475-c659-4a1a-afef-5091bd4781f7";
  };
}
