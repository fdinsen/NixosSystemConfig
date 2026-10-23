{ ... }:
{
  # Add/change/delete surrounding delimiter pairs with ease.
  # https://nix-community.github.io/nixvim/plugins/nvim-surround/index.html
  flake.nixvimPlugins.editing.surround =
    { ... }:
    {
      programs.nixvim = {
        plugins.nvim-surround = {
          enable = true;
          settings = {
          };
        };
      };
    };
}
