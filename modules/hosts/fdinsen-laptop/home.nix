{ self, config, ... }:
{
  flake.homeModules.fdinsen-laptop-home =
    {
      lib,
      pkgs,
      ...
    }:
    {
      imports = with config.home; [
        default
        plasma.base
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
      ];

      custom = {
        "plasma.panels" = {
          panelColorizerPreset = "DockTheme";
          pinnedApps = [
            "browser"
            "filemanager"
            "kitty"
            "md.obsidian.Obsidian"
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
