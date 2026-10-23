{ ... }:
{
  flake.plasmaHome.extensions.tilingWindowManagement =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.kdePackages.krohnkite
      ];
      programs.plasma = {
        configFile.kwinrc = {
          Plugins = {
            krohnkiteEnabled = true;
            kzonesEnabled = false;
          };
          "Script-krohnkite" = {
            screenGapBetween = 6;
            screenGapBottom = 8;
            screenGapLeft = 8;
            screenGapRight = 8;
            screenGapTop = 8;
            monocoleLayoutOrder = 6;
            monocleMaximize = false;
            stackedLayoutOrder = 3;
            threeColumnLayoutOrder = 2;
          };
        };

        shortcuts.kwin = {
          "KrohnkiteFocusDown" = [
            "Meta+Down"
            "Meta+J"
          ];
          "KrohnkiteFocusLeft" = [
            "Meta+Left"
            "Meta+H"
          ];
          "KrohnkiteFocusUp" = [
            "Meta+Up"
            "Meta+K"
          ];
          "KrohnkiteFocusRight" = [
            "Meta+Right"
            "Meta+L"
          ];
          "KrohnkiteRotate" = [ "Meta+R" ];
          "KrohnkiteSetMaster" = [ "Meta+Return" ];
          "KrohnkiteShiftDown" = [
            "Meta+Shift+Down"
            "Meta+Shift+J"
          ];
          "KrohnkiteShiftUp" = [
            "Meta+Shift+Up"
            "Meta+Shift+K"
          ];
          "KrohnkiteShiftLeft" = [
            "Meta+Shift+Left"
            "Meta+Shift+H"
          ];
          "KrohnkiteShiftRight" = [
            "Meta+Shift+Right"
            "Meta+Shift+L"
          ];
          "KrohnkiteShrinkHeight" = [ "Meta+Ctrl+K" ];
          "KrohnkiteShrinkWidth" = [ "Meta+Ctrl+H" ];
          "KrohnkiteGrowHeight" = [ "Meta+Ctrl+J" ];
          "KrohnkitegrowWidth" = [ "Meta+Ctrl+L" ]; # <- This has lower case g...
          "KrohnkiteStackedLayout" = "Meta+S";
          "KrohnkiteTreeColumnLayout" = "Meta+C";
          "KrohnkiteTileLayout" = "Meta+T";
          "KrohnkiteMonocleLayout" = "Meta+F";
        };
      };
    };
}
