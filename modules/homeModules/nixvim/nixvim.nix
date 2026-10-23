{ self, ... }:
{
  flake.homeModules.nixvim =
    { pkgs, ... }:
    {
      imports = [
        self.homeModules."nixvim.keymaps"
        self.homeModules."nixvim.plugins"
        self.homeModules."nixvim.langs"
        self.homeModules."nixvim.colorschemes.everforest"
        self.homeModules."nixvim.lsp"
      ];
      programs.nixvim = {
        nixpkgs.config.allowUnfree = true;
        enable = true;

        extraConfigVim = ''
          filetype plugin indent on
          syntax on
        '';

        # -----------------------------
        # Core editor options
        # -----------------------------
        opts = {
          number = true;
          relativenumber = true;
          signcolumn = "yes";
          mouse = "a";

          tabstop = 2;
          shiftwidth = 2;
          expandtab = true;
          smartindent = true;

          clipboard = "unnamedplus";
          termguicolors = true;
          splitright = true;
          splitbelow = true;
          wrap = false;

          title = true;
          titlestring = "nvim - %{fnamemodify(getcwd(), ':t')}%( - %t%)";
        };
        # Leader key
        globals.mapleader = " ";
        globals.maplocalleader = ",";

        diagnostic.settings = {
          virtual_text = true;
          signs = true;
          underline = true;
          update_in_insert = false;
          severity_sort = true;
          float.border = "rounded";
        };

        autoCmd = [
          # Automatically open diagnostics popup when not moving cursor
          {
            event = "CursorHold";
            callback.__raw = ''
              function()
                vim.diagnostic.open_float(nil, { focusable = false })
              end
            '';
          }
        ];
        # -----------------------------
        # Extra polish
        # -----------------------------
        extraConfigLua = ''
          local notify = vim.notify
          vim.notify = function(msg, level, opts)
            if msg:match("position_encoding") then
              return
            end
            notify(msg,level,opts)
          end
        '';
      };
    };
}
