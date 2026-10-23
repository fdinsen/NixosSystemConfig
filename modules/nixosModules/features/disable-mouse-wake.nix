{ ... }:
{
  flake.nixosModules.disable-mouse-wake = { ... }: {
    # Disable mouse-wake from sleep
    services.udev.extraRules = ''
      ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}="046d", ATTR{idProduct}=="c547", \
      TEST=="power/wakeup", ATTR{power/wakeup}="disabled"
    '';
  };
}
