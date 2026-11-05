{ self, inputs, ... }:
{
  home.hyprland.plugins.hyprfocus = { pkgs, ... }: {
    wayland.windowManager.hyprland = {
      plugins = [
        inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprfocus
      ];
      extraConfig = "";
    };
  };
}
