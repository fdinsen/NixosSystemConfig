{ inputs, config, ... }:
{
  flake.nixosConfigurations.fdinsen-desktop = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = { inherit inputs; };
    modules = [
      {
        home-manager.users.fdinsen = config.home.hosts.fdinsen-desktop;
      }
    ]
    ++ (with config.nixos; [
      hosts.fdinsen-desktop

      nix.default
      system.default
      networking.default
      desktop.default

      plasma.base

      gaming.ffxiv
      gaming.minecraft
      gaming.base

      hardware.fdinsen-desktop

      dev.default
    ]);
  };

  home.hosts.fdinsen-desktop = {
    imports = with config.home; [
      default
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
      # User account
      username = "fdinsen";
      homeDirectory = "/home/fdinsen";
    };
  };

}
