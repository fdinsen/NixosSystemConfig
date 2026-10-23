{ ... }: {
  flake.nixosModules.lazygit = { ... }: {
    programs.lazygit = {
      enable = true;
      settings = {
        git = {
          overrideGpg = true;
        };
      };
    };
  };
}
