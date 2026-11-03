{ ... }:
{
  home.plasma.extensions.dialog-flyout = {
    programs.plasma.configFile.kwinrc = {
      "Plugins" = {
        sheetEnabled = true;
      };
    };
  };
}
