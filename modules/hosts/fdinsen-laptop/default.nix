{
  inputs,
  config,
  ...
}:
{
  flake.nixosConfigurations.fdinsen-laptop = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = { inherit inputs; };
    modules = [
      {
        home-manager.users.fdinsen = config.home.hosts.fdinsen-laptop;
      }
    ]
    ++ (with config.nixos; [
      default

      hosts.fdinsen-laptop
      hardware.fdinsen-laptop

      boot.linux-kernel-latest

      desktop.rkp
      desktop.media
      desktop.notes

    ]);
  };

  home.hosts.fdinsen-laptop = {
    imports = with config.home; [
      default

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
      username = "fdinsen";
      homeDirectory = "/home/fdinsen";
      stateVersion = "25.11";
    };
  };

}
