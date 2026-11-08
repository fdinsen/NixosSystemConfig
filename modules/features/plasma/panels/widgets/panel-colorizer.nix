{ ... }:
{
  home.plasma.widgets =
    { config, ... }:
    let
      inherit (config.plasma-workspace) panelColorizerPreset;

      panelColorizerPresetPath =
        config.programs.plasma-panel-colorizer.presetPaths.${panelColorizerPreset};
    in
    {
      plasma-widgets.panel-colorizer = {
        name = "luisbocanegra.panel.colorizer";
        config = {
          General = {
            hideWidget = true;
            lastPreset = panelColorizerPresetPath;
            pluginFound = true;
            presetAutoloading = ''
              {"enabled":true,"normal":"${panelColorizerPresetPath}"}
            '';
          };
        };
      };
    };
}
