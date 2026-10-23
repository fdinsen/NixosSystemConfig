{ ... }:
{
  # The undo history visualizer for Vim.
  # https://nix-community.github.io/nixvim/plugins/undotree/index.html
  flake.nixvimPlugins.editing.undotree =
    { ... }:
    {
      programs.nixvim = {
        plugins.undotree = {
          enable = true;
          settings = {
          };
        };
        keymaps = [
          {
            key = "<leader>u";
            options.desc = "Undotree";
            action = ":UndotreeToggle<CR>:UndotreeFocus<CR>";
          }
        ];
      };
    };
}
