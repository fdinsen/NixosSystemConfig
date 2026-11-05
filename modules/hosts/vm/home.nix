{ config, ... }:
{
  flake.homeModules.fdinsen-vm-home = { pkgs, ... }: {
    imports = [
      config.home.hyprland.base
    ];

    home = {
      packages = [ ];
    };

    custom = {

    };
  };
}
