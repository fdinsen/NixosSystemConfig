{ lib, inputs, ... }:
{
  options.nixos.hyprland.base = lib.mkOption {
    type = lib.types.deferredModule;
  };
  options.home.hyprland.base = lib.mkOption {
    type = lib.types.deferredModule;
  };

  config.nixos.hyprland.base = { pkgs, ... }: {
    programs.hyprland.enable = true;
    # programs.hyprland.package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

    environment.systemPackages = [
      pkgs.kitty
      pkgs.waybar
      pkgs.hyprpaper
    ];
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };

  config.home.hyprland.base = { pkgs, ... }: {
    imports = [
      # plugins
      inputs.dms.homeModules.dank-material-shell
    ];

    programs.dank-material-shell = {
      enable = true;
      systemd.enable = true;
    };

    wayland.windowManager.hyprland = {
      enable = true;
      configType = "lua";
      extraConfig = ''
        hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("rofi -show drun"))
        -- Terminal
        hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("kitty"))
      '';
    };
  };
}
