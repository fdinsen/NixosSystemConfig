{ self, lib, ... }:
{
  flake.homeModules."plasma.panels" =
    { config, pkgs, ... }:
    let
      cfg = config.custom."plasma.panels";
      inherit (cfg) mixedMonitorOrientation;
      inherit (mixedMonitorOrientation) landscapeMonitors portraitMonitors;
      inherit (import ./_widgets.nix { inherit self cfg config; })
        panel-colorizer
        kara
        windowtitle
        systemtray
        icontasks
        ;

      left-short = [
        panel-colorizer
        windowtitle
      ];
      left = left-short ++ [
        "org.kde.plasma.marginsseparator"
        "plasmusic-toolbar"
      ];
      middle = [
        icontasks
        panel-colorizer
      ];

      right = [
        systemtray
        "org.kde.plasma.marginsseparator"
        kara
        "org.kde.plasma.marginsseparator"
        "org.kde.plasma.digitalclock"
        panel-colorizer
      ];

      makePanel = location: alignment: screen: maxLength: widgets: {
        inherit
          location
          alignment
          screen
          maxLength
          widgets
          ;
        floating = true;
        height = 40;
        lengthMode = "fit";
        opacity = "translucent";
      };
      makeTopPanel = makePanel "top";

      panels =
        if mixedMonitorOrientation.enable then
          [
            (makeTopPanel "left" landscapeMonitors 950 left)
            (makeTopPanel "center" "all" null middle)
            (makeTopPanel "right" landscapeMonitors null right)

            (makeTopPanel "left" portraitMonitors 430 left-short)
            (makeTopPanel "right" portraitMonitors 430 right)
          ]
        else
          [
            (makeTopPanel "left" "all" 950 left)
            (makeTopPanel "center" "all" null middle)
            (makeTopPanel "right" "all" null right)
          ];
    in
    {
      imports = [
        self.homeModules.plasma-panel-colorizer
      ];

      config = {
        programs.plasma = {
          inherit panels;
        };
        programs.plasma-panel-colorizer = {
          enable = true;
          # Automatically adds all new themes in assets to plasma-panel-colorizer
          presets = self.lib.assets.panelColorizerThemes;
        };
      };

      options.custom."plasma.panels" = {
        panelColorizerPreset = lib.mkOption {
          type = lib.types.str;
          description = "Path to the panel-colorizer preset.";
        };
        pinnedApps = lib.mkOption {
          type = lib.types.listOf self.lib.plasma.types.pinnableApps;
          description = "List of apps to pin to taskbar";
        };
        mixedMonitorOrientation = {
          enable = lib.mkEnableOption "support for mixed orientation of monitors";
          landscapeMonitors = lib.mkOption {
            type =
              with lib.types;
              oneOf [
                int
                (listOf int)
                (enum [ "all" ])
              ];
            description = "The indices of the monitors with landscape orientation";
            default = "all";
          };
          portraitMonitors = lib.mkOption {
            type =
              with lib.types;
              oneOf [
                int
                (listOf int)
                (enum [ "all" ])
              ];
            description = "The indices of the monitors with portrait orientation";
            default = [ ];
          };
        };
      };
    };
}
