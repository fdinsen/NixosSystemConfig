{
  self,
  lib,
  ...
}:
{
  options.nixos.plasma.lockscreen = lib.mkOption {
    default = { };
    type = lib.types.deferredModule;
  };
  options.home.plasma.lockscreen = lib.mkOption {
    default = { };
    type = lib.types.deferredModule;
  };

  config.nixos.plasma.lockscreen =
    { pkgs, config, ... }:
    let
      wallpaper-name = "wallpaper.png";
      cfg = config.custom.plasma;
      sddm-astronaut =
        (pkgs.sddm-astronaut.override {
          embeddedTheme = "purple_leaves";
          themeConfig = {
            # HeaderTextColor = "#d5c4a1";
            Background = "Backgrounds/${wallpaper-name}";
            FormPosition = cfg.loginAlign;
            BlurMax = 64;
            Blur = "1.0";
          };
        }).overrideAttrs
          (oldAttrs: {
            # Optional: Inject custom background image
            installPhase = oldAttrs.installPhase + ''
              chmod u+w $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/
              cp ${self.lib.assets.wallpapers.${cfg.loginWallpaper}} \
                $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/${wallpaper-name}
            '';
          });
    in
    {
      options.custom.plasma = {
        loginAlign = lib.mkOption {
          type = lib.types.enum [
            "left"
            "center"
            "right"
          ];
          default = "center";
          description = "Horizontal alignment of the SDDM login form.";
        };
        loginWallpaper = lib.mkOption {
          type = lib.types.str;
          default = "shadedLandscape";
          description = "The name of the wallpaper in the assets library to use on the login screen.";
        };
      };

      config = {
        services.displayManager.sddm = {
          enable = true;
          wayland.enable = true;
          theme = "sddm-astronaut-theme";
          extraPackages = [
            pkgs.kdePackages.qtmultimedia
          ];
        };
        environment.systemPackages = [
          sddm-astronaut
        ];
      };
    };

  config.home.plasma.lockscreen =
    { ... }:
    {
      programs.plasma = {
        kscreenlocker.appearance.wallpaper = self.lib.assets.wallpapers.shadedLandscape;

        shortcuts.ksmserver = {
          "Lock Session" = [
            "Meta+Ctrl+Shift+Alt+L"
            "Screensaver"
            "Lock Session"
          ];
        };
      };
    };
}
