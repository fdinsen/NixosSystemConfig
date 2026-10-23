{ self, ... }:
{
  flake.nixosModules.plasma =
    {
      config,
      lib,
      pkgs,
      ...
    }:
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
        # Enable the KDE Plasma Desktop Environment.
        services.displayManager.sddm = {
          enable = true;
          wayland.enable = true;
          theme = "sddm-astronaut-theme";
          extraPackages = [
            pkgs.kdePackages.qtmultimedia
          ];
        };
        services.desktopManager.plasma6.enable = true;

        environment.systemPackages = with pkgs; [
          # UTILITIES
          kdePackages.kcalc
          gnome-clocks

          # STYLE
          kdePackages.qtstyleplugin-kvantum
          kdePackages.qt6ct
          kdePackages.kdecoration
          sddm-astronaut
        ];

        environment.variables.QT_QPA_PLATFORMTHEME = "kde";

        nixpkgs.overlays = [
          (final: prev: {
            plasma-panel-colorizer = prev.plasma-panel-colorizer.overrideAttrs {
              postInstall = "chmod 755 $out/share/plasma/plasmoids/luisbocanegra.panel.colorizer/contents/ui/tools/list_presets.sh";
            };
          })
        ];
      };
    };
}
