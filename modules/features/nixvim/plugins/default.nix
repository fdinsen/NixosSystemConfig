{ lib, config, ... }:
{
  options.home.nixvim.plugins = lib.mkOption {
    type = lib.types.submodule {
      options = {
        default = lib.mkOption { type = lib.types.deferredModule; };
      }
      //
        lib.genAttrs
          [
            "completion"
            "debug"
            "editing"
            "git"
            "lsp"
            "navigation"
            "syntax"
            "tools"
            "ui"
          ]
          (
            category:
            lib.mkOption {
              type = lib.types.lazyAttrsOf lib.types.deferredModule;
              default = { };
              description = "Nixvim ${category}-related plugin modules, merged across the module tree.";
            }
          );
    };
  };
  config.home.nixvim.plugins.default = {
    imports = with config.home.nixvim.plugins; [
      completion.cmp
      completion.luasnip

      debug.dap

      editing.neogen
      editing.autopairs
      editing.surround
      editing.undotree
      editing.yanky
      editing.spectre

      git.hunk
      git.diffview

      lsp.actions-preview
      lsp.conform
      lsp.goto-preview
      lsp.trouble
      lsp.fidget

      navigation.nvim-tree
      navigation.telescope
      navigation.flash

      syntax.treesitter

      tools.markdown-preview
      tools.opencode

      ui.toggleterm
      ui.barbar
      ui.modicator
      ui.dressing
      ui.which-key
      ui.lualine
    ];
    programs.nixvim.plugins = {
      web-devicons.enable = true;

      nui.enable = true;

      rainbow-delimiters.enable = true;

      # Git integration
      gitsigns.enable = true;

      # Comment toggling
      comment.enable = true;
    };
  };
}
