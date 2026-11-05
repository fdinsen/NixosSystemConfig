{ lib, ... }:
{
  flake.nixvimPlugins.navigation.nvim-tree-preview =
    { pkgs, ... }:
    let
      nvim-tree-preview = pkgs.vimUtils.buildVimPlugin {
        name = "nvim-tree-preview";
        src = pkgs.fetchFromGitHub {
          owner = "b0o";
          repo = "nvim-tree-preview.lua";
          rev = "3f188af9a60aaf83fc732077478d2d90dbccd55f";
          sha256 = "sha256-BHDVAsv9pbPRDL7pD3EPH4kzlO2ByuI+6jxBmDYOQpU=";
        };
        nvimSkipModules = [
          "nvim-tree-preview"
          "nvim-tree-preview.manager"
          "nvim-tree-preview.preview"
        ];
      };
    in
    {
      programs.nixvim = {
        extraConfigLua = ''
          require('nvim-tree-preview').setup({
              win_position = {
                -- Replicates nvim-tree-preview's built-in row calculation,
                -- without touching require('nvim-tree').config, which is
                -- nil on current nvim-tree.lua (upstream incompatibility).
                row = function(tree_win, size)
                  local cursor_row = vim.api.nvim_win_get_cursor(tree_win)[1] - 1
                  local win_info = vim.fn.getwininfo(tree_win)[1]
                  local topline = win_info.topline - 1
                  local relative_cursor = cursor_row - topline

                  local win_pos = vim.api.nvim_win_get_position(tree_win)
                  local screen_row = win_pos[1] + relative_cursor
                  local editor_height = vim.api.nvim_get_option_value('lines', {}) - 1

                  local row = relative_cursor
                  if screen_row + size.height > editor_height then
                    row = relative_cursor - ((screen_row + size.height) - editor_height)
                  end
                  return row
                end,
                -- Assumes nvim-tree's view.side is 'left' (the default, and what
                -- your config uses since you never set view.side).
                col = function(tree_win, size)
                  return vim.fn.winwidth(tree_win) + 1
                end,
              },
            })
        '';
        extraPlugins = [
          nvim-tree-preview
        ];
      };
    };
}
