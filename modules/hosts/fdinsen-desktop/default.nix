{ inputs, config, ... }:
{
  flake.nixosConfigurations.fdinsen-desktop = config.lib.hosts.mkNixosHost {
    modules = with config.nixos; [
      default

      hosts.fdinsen-desktop

      boot.windows-dualboot

      desktop.rkp
      desktop.media
      desktop.notes

      gaming.ffxiv
      gaming.minecraft
      gaming.base

      hardware.fdinsen-desktop
    ];
    username = "fdinsen";
    home = config.home.hosts.fdinsen-desktop;
  };

  home.hosts.fdinsen-desktop = {
    imports = with config.home; [
      default
      hardware.logitechG502

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
      username = "fdinsen";
      homeDirectory = "/home/fdinsen";
      stateVersion = "25.11";
    };
  };

}
