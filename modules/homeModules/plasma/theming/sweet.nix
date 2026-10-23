{ self, ... }:
{
  flake.plasmaHome.theming.sweet =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.sweet-nova
        pkgs.kdePackages.aurorae
      ];
      programs.plasma = {
        workspace = {
          theme = "Sweet";
          colorScheme = "Sweet";
          cursor.theme = "Sweet-cursors";
          iconTheme = "Tela-dark";
          windowDecorations = {
            library = "org.kde.kwin.aurorae.v2";
            theme = "__aurorae__svg__Sweet-Dark-transparent";
          };
          splashScreen.theme = "Kuro";
          widgetStyle = "kvantum-dark";
          wallpaper = [
            (toString self.lib.assets.wallpapers.shadedLandscape)
            (toString self.lib.assets.wallpapers.mountainPeak)
            (toString self.lib.assets.wallpapers.snowyMountainPortrait)
          ];
        };
        kscreenlocker.appearance.wallpaper = self.lib.assets.wallpapers.shadedLandscape;

        configFile.breezerc = {
          Style = {
            MenuOpacity = 50;
            SliderDrawTickMarks = false;
            TabBarDrawCenteredTabs = true;
            WindowDragMod = "WD_FULL";
          };
        };
      };

      xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
        [General]
        theme=Sweet-transparent-toolbar
      '';
    };
}
