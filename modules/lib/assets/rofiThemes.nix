{ ... }:
let
  assetsDir = ../../../assets;
  rofiThemes = "${assetsDir}/rofiThemes";
in
{
  flake.lib.assets.rofiThemes = {
    rofiTheme = "${rofiThemes}/rofiTheme.rasi";
    roundedGlass = "${rofiThemes}/roundedGlass.rasi";
  };
}
