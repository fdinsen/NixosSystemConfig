{ ... }:
{
  flake.nixosModules.keyboard = { ... }: {
    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "dk";
      variant = "nodeadkeys";
      options = "caps:escape,compose:rwin";
    };

    # Configure console keymap
    console.keyMap = "dk-latin1";
  };
}
