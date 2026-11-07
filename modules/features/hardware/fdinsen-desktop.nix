{ config, ... }:
{
  nixos.hardware.fdinsen-desktop = {
    imports = with config.nixos.hardware; [
      nvidia-drivers
      logitechG502
      disable-mouse-wake
    ];

    # File system setup for other drives
    fileSystems."/mnt/ssd256" = {
      device = "/dev/disk/by-label/ssd256";
      fsType = "ext4";
    };
  };
}
