# configuration file for all the settings that are common to all setups
{ self, inputs, ... }:

{
  flake.nixosModules.common = { pkgs, ... }: {
    imports =
      (with self.modules.nixos; [
        kara
      ])
      ++ (with self.nixosModules; [
        networking
        bootloader
        locale
        keyboard
        audio
        unfree
        nixExperimentalFeatures
        fonts
        printing
        defaultPackages
        ca-blacklist
      ]);

    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.
    # services.xserver.enable = true;

  };
}
