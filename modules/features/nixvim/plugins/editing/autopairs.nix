{ ... }:
{
  # Insert and delete brackets, parens, quotes in pair automatically.
  # https://nix-community.github.io/nixvim/plugins/nvim-autopairs/index.html
  flake.nixvimPlugins.editing.autopairs =
    { ... }:
    {
      programs.nixvim = {
        plugins.nvim-autopairs = {
          enable = true;
          settings = {
          };
        };
      };
    };
}
