{ self, cfg, config }:
let
  inherit (cfg) pinnedApps panelColorizerPreset;
  pinnedAppsKde = self.lib.plasma.appsToKdeShape pinnedApps;

  panelColorizerPresetPath =
    config.programs.plasma-panel-colorizer.presetPaths.${panelColorizerPreset};
in
{
  panel-colorizer = {
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
  kara = {
    name = "org.dhruv8sh.kara";
    config = {
      general = {
        type = 0;
      };
    };
  };
  windowtitle = {
    name = "org.kde.windowtitle";
    config = {
      Appearance = {
        activityIcon = false;
        altTxt = "Desktop";
        customIcon = "user-desktop-symbolic";
        fixedLength = 400;
        lengthKind = 2; # maximum length
      };
    };
  };
  icontasks = {
    name = "org.kde.plasma.icontasks";
    config = {
      General = {
        iconSpacing = 3;
        launchers = builtins.concatStringsSep "," pinnedAppsKde;
      };
    };
  };
  systemtray = {
    name = "org.kde.plasma.systemtray";
    config = {
      General = {
        extraItems = builtins.concatStringsSep "," [
          "org.kde.plasma.manage-inputmethod"
          "org.kde.plasma.devicenotifier"
          "org.kde.plasma.cameraindicator"
          "org.kde.plasma.notifications"
          "org.kde.plasma.keyboardlayout"
          "org.kde.plasma.printmanager"
          "org.kde.kscreen"
          "org.kde.plasma.keyboardindicator"
          "org.kde.plasma.networkmanagement"
          "org.kde.plasma.battery"
          "org.kde.plasma.volume"
          "org.kde.plasma.clipboard"
        ];
        hiddenItems = builtins.concatStringsSep "," [
          "org.kde.plasma.clipboard"
        ];
        knownItems = builtins.concatStringsSep "," [
          "org.kde.plasma.manage-inputmethod"
          "org.kde.plasma.devicenotifier"
          "org.kde.plasma.clipboard"
          "org.kde.plasma.cameraindicator"
          "org.kde.plasma.notifications"
          "org.kde.plasma.mediacontroller"
          "org.kde.plasma.keyboardlayout"
          "org.kde.plasma.printmanager"
          "org.kde.kscreen"
          "org.kde.plasma.keyboardindicator"
          "org.kde.plasma.networkmanagement"
          "org.kde.plasma.volume"
          "org.kde.plasma.weather"
          "org.kde.plasma.brightness"
          "org.kde.plasma.battery"
        ];
        shownItems = builtins.concatStringsSep "," [
          "org.kde.plasma.volume"
        ];
        iconSpacing = 6;
      };
    };
  };
}
