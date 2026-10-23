{ self, lib, ... }:
{
  config.flake.homeModules."nixvim.plugins" =
    { ... }:
    {
      imports = with self.nixvimPlugins; [
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

  options.flake.nixvimPlugins = lib.mkOption {
    type = lib.types.submodule {
      options =
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
            _category:
            lib.mkOption {
              type = lib.types.lazyAttrsOf lib.types.raw;
              default = { };
              description = "Nixvim plugin modules in this category, merged across the module tree.";
            }
          );
    };
    default = { };
    description = "Nixvim plugin modules, collected and merged across the module tree.";
  };
}
