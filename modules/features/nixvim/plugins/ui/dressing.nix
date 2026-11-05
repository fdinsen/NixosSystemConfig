{ ... }:
{

  # Neovim plugin to improve the default vim.ui interfaces.
  # https://nix-community.github.io/nixvim/plugins/dressing/index.html
  home.nixvim.plugins.ui.dressing =
    { ... }:
    {
      programs.nixvim = {
        plugins.dressing = {
          enable = true;
          settings = {
          };
        };
      };
    };
}
