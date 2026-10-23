{ self, inputs, ... }:
{
  flake.hyprlandHome.plugins.hyprfocus = { pkgs, ... }: {
    wayland.windowManager.hyprland = {
      plugins = [
        inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprfocus
      ];
      extraConfig = "";
    };
  };
}
