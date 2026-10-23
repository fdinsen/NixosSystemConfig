{ self, username, ... }:
{
  flake.homeModules.fdinsen-vm-home = { pkgs, ... }: {
    imports = [
      self.homeModules.hyprland
    ];

    home = {
      packages = [ ];
    };

    custom = {

    };
  };
}
