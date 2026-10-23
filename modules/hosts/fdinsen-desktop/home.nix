{ self, inputs, ... }:
{
  flake.homeModules.fdinsen-desktop-home =
    {
      lib,
      pkgs,
      config,
      ...
    }:
    {
      imports = [
        self.homeModules.plasma
        self.homeModules."plasma.panels"
      ];

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
        nixvimLangs.java.enable = true;
        nixvimLangs.nix-nil.enable = true;
        nixvimLangs.rust.enable = true;
        nixvimLangs.haskell.enable = true;
        nixvimLangs.idris2.enable = true;
        nixvimLangs.rocq.enable = true;
        nixvimLangs.scala.enable = true;
        nixvimLangs.python.enable = true;
        nixvimLangs.ts.enable = true;
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
