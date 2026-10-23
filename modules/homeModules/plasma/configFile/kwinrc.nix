{ ... }:
{
  flake.plasmaHome.configFile.kwinrc =
    { ... }:
    {
      programs.plasma.configFile.kwinrc = {
        "EdgeBarrier" = {
          CornerBarrier = false;
          EdgeBarrier = 0;
        };
        "Effect-kwin4_effect_geometry_change" = {
          Duration = 500;
        };
        "Effect-translucency" = {
          MoveResize = 78;
        };
        "Plugins" = {
          kwin4_effect_geometry_changeEnabled = true;
          sheetEnabled = true;
          sticky-window-snappingEnabled = false;
          translucencyEnabled = true;
        };
        "Round-Corners" = {
          ActiveOutlineUseCustom = false;
          ActiveOutlineUsePalette = true;
          DisableOutlineFullScreen = true;
          DisableOutlineMaximize = false;
          DisableOutlineTile = false;
          DisableRoundTile = false;
          Size = 15;
          InactiveCornerRadius = 15;
        };
        "TabBox" = {
          LayoutName = "thumbnail_grid";
        };
        "org.kde.kdecoration2" = {
          BorderSize = "None";
          BorderSizeAuto = false;
        };
      };
    };
}
