{ config, ... }:
{
  nixos.hardware.fdinsen-laptop = {
    imports = with config.nixos.hardware; [
      fingerprint-login
    ];
  };
}
