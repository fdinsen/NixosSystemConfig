{ ... }:
let
  assetsDir = ../../../assets;
  panelColorizerThemes = "${assetsDir}/panelColorizerThemes";
in
{
  flake.lib.assets.panelColorizerThemes = {
    DockTheme = {
      source = "${panelColorizerThemes}/DockTheme/settings.json";
      preview = "${panelColorizerThemes}/DockTheme/preview.png";
    };
  };
}
