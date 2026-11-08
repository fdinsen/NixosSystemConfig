{
  config,
  self,
  lib,
  ...
}:
{
  nixos.plasma.panels.base = {
    imports = [
      config.nixos.overlays.kara
    ];
  };

  home.plasma.panels.base = { pkgs, ... }: {
    imports = with config.home.plasma; [
      panels.default
      panels.plasma-panel-colorizer
      widgets
      panels.panels
    ];

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
}
