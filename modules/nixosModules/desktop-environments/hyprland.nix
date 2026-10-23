{ inputs, ... }:
{
  flake.nixosModules.hyprland = { pkgs, ... }: {
    programs.hyprland.enable = true;
    # programs.hyprland.package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

    environment.systemPackages = [
      pkgs.kitty
      pkgs.waybar
      pkgs.hyprpaper
    ];
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
