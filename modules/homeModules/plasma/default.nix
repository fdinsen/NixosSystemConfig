{ self, lib, ... }:
{
  config.flake.homeModules.plasma =
    { pkgs, inputs, ... }:
    {
      imports = with self.plasmaHome; [
        base.shortcuts

        theming.sweet
        input.logitechG502
        extensions.virtualDesktops
        extensions.windowBlur
        extensions.tilingWindowManagement
        extensions.geometryChange
        configFile.kwinrc
      ];
      home.packages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.windowTitleApplet
        self.packages.${pkgs.stdenv.hostPlatform.system}.kara
        # pkgs.kara
        pkgs.plasma-panel-colorizer
        pkgs.kde-rounded-corners
        pkgs.plasmusic-toolbar
        pkgs.tela-icon-theme
      ];

      programs.plasma = {
        enable = true;

        powerdevil.AC.autoSuspend.action = "nothing";
        powerdevil.AC.turnOffDisplay.idleTimeout = "never";
      };
    };

  options.flake.plasmaHome = lib.mkOption {
    type = lib.types.lazyAttrsOf (lib.types.lazyAttrsOf lib.types.deferredModule);
  };
}
