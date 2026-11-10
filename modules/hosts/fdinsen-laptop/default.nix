{ config, ... }:
{
  flake.nixosConfigurations.fdinsen-laptop = config.lib.hosts.mkNixosHost {
    features = [
      "default"
      "system.user-fdinsen"

      "hardware.fdinsen-laptop"

      "boot.linux-kernel-latest"

      "desktop.rkp"
      "desktop.media"
      "desktop.notes"
    ];
    username = "fdinsen";
    hostname = "fdinsen-laptop";
    stateVersion = "26.05";
    home = config.home.hosts.fdinsen-laptop;
    hardware-config = ./_hardware-configuration.nix;
  };

  home.hosts.fdinsen-laptop = {
    imports = with config.home; [
      plasma.panels.fdinsen-laptop

      nixvim.plugins.tools.opencode
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
