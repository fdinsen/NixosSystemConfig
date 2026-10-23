{
  self,
  inputs,
  lib,
  ...
}:
{
  config.flake.homeModules.hyprland = { pkgs, ... }: {
    imports = with self.hyprlandHome; [
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
  options.flake.hyprlandHome = lib.mkOption {
    type = lib.types.submodule {
      freeformType = lib.types.lazyAttrsOf (
        lib.types.submodule {
          freeformType = lib.types.lazyAttrsOf lib.types.raw;
        }
      );
    };
  };
}
