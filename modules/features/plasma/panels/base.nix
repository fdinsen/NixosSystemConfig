{
  config,
  self,
  lib,
  ...
}:
{
  nixos.plasma.panels.base = {
    imports = [
      self.modules.nixos.kara
    ];
  };

  home.plasma.panels.base = { pkgs, ... }: {
    imports = with config.home.plasma; [
      panels.plasma-panel-colorizer
      widgets
      panels.panels
    ];

    config = {
      home.packages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.windowTitleApplet
        # self.packages.${pkgs.stdenv.hostPlatform.system}.kara
        pkgs.kara
        pkgs.plasma-panel-colorizer
        pkgs.plasmusic-toolbar
      ];
      programs.plasma-panel-colorizer = {
        enable = true;
        # Automatically adds all new themes in assets to plasma-panel-colorizer
        presets = config.lib.assets.panelColorizerThemes;
      };
    };

    options.custom.plasma.panels = {
      panelColorizerPreset = lib.mkOption {
        type = lib.types.str;
        description = "Path to the panel-colorizer preset.";
      };
      pinnedApps = lib.mkOption {
        type = lib.types.listOf config.lib.plasma.types.pinnableApps;
        description = "List of apps to pin to taskbar";
      };
    };
  };
}
