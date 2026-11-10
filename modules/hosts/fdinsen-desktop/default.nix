{ config, ... }:
{
  flake.nixosConfigurations.fdinsen-desktop = config.lib.hosts.mkNixosHost {
    features = [
      "default"
      "system.user-fdinsen"

      "boot.windows-dualboot"

      "desktop.rkp"
      "desktop.media"
      "desktop.notes"

      "gaming.ffxiv"
      "gaming.minecraft"
      "gaming.base"

      "hardware.fdinsen-desktop"
    ];
    username = "fdinsen";
    hostname = "fdinsen-desktop";
    stateVersion = "25.11";
    home = config.home.hosts.fdinsen-desktop;
    hardware-config = ./_hardware-configuration.nix;
  };

  home.hosts.fdinsen-desktop = {
    imports = with config.home; [
      hardware.logitechG502

      plasma.panels.fdinsen-desktop

      nixvim.tools.opencode
      nixvim.langs.java
      nixvim.langs.rust
      nixvim.langs.haskell
      nixvim.langs.idris2
      nixvim.langs.rocq
      nixvim.langs.scala
      nixvim.langs.python
      nixvim.langs.ts
    ];

    home = {
      username = "fdinsen";
      homeDirectory = "/home/fdinsen";
      stateVersion = "25.11";
    };
  };

}
