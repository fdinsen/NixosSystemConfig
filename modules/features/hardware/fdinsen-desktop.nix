{ config, ... }:
{
  nixos.hardware.fdinsen-desktop = {
    imports = with config.nixos.hardware; [
      nvidia-drivers
      logitechG502
      disable-mouse-wake
    ];
  };
}
