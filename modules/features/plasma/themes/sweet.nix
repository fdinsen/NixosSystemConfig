{ config, ... }:
{
  nixos.plasma.themes.sweet =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        # STYLE
        kdePackages.qtstyleplugin-kvantum
        kdePackages.qt6ct
        kdePackages.kdecoration
      ];

      environment.variables.QT_QPA_PLATFORMTHEME = "kde";
    };

  home.plasma.themes.sweet =
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
            (toString config.lib.assets.wallpapers.shadedLandscape)
            (toString config.lib.assets.wallpapers.mountainPeak)
            (toString config.lib.assets.wallpapers.snowyMountainPortrait)
          ];
        };

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
