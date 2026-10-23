{ ... }:
let
  assetsDir = ../../../assets;
  wallpapers = "${assetsDir}/wallpapers";
in
{
  flake.lib.assets.wallpapers = {
    # Core
    shadedLandscape = "${wallpapers}/shaded_landscape.png";
    snowyMountainPortrait = "${wallpapers}/snowy-mountain-portrait.jpg";
    mountainPeak = "${wallpapers}/peakpx.jpg";

    # Extra
    neonCity = "${wallpapers}/neon-city.jpg";
    lofiCity = "${wallpapers}/lofiwallpaper.png";
    landscapeMinimalist = "${wallpapers}/Landscape-Minimalist.jpg";
  };
}
