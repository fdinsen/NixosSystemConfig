{ self, config, ... }:
{
  flake.homeModules.fdinsen-desktop-home =
    {
      lib,
      pkgs,
      ...
    }:
    {
      imports = (
        with config.home;
        [
          plasma.base
          hardware.logitechG502
          dev.default
          desktop.default

          nixvim.langs.java
          nixvim.langs.rust
          nixvim.langs.haskell
          nixvim.langs.idris2
          nixvim.langs.rocq
          nixvim.langs.scala
          nixvim.langs.python
          nixvim.langs.ts
        ]
      );

      custom = {
        "plasma.panels" = {
          panelColorizerPreset = "DockTheme";
          mixedMonitorOrientation = {
            enable = true;
            landscapeMonitors = [
              0
              1
            ];
            portraitMonitors = 2;
          };
          pinnedApps = [
            "browser"
            "filemanager"
            "kitty"
            "md.obsidian.Obsidian"
            "steam"
            "element-desktop"
          ];
        };
      };

      home = {
        packages = [ ];
        sessionVariables = {
          SSH_ASKPASS = "";
        };

        # User account
        username = "fdinsen";
        homeDirectory = "/home/fdinsen";
      };
    };
}
