{ ... }: {
  nixos.dev.lazygit = { ... }: {
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
