{ lib, ... }:
{
  flake.nixvimLangs.idris2 =
    { config, ... }:
    let
      cfg = config.custom.nixvimLangs.idris2;
    in
    {
      options.custom.nixvimLangs.idris2 = {
        enable = lib.mkEnableOption "nixvimLangs.idris2";
      };
      config = lib.mkIf cfg.enable {
        programs.nixvim = {
          plugins.idris2 = {
            enable = true;
          };
          autoCmd = [
            {
              event = "FileType";
              pattern = "idris2";
              callback = {
                __raw = ''
                    function()
                      local opts = { buffer = true, silent = true, nowait = true }
                      -- Alt-c followed by command keys
                      vim.keymap.set('n', '<M-c><M-a>', '<cmd>lua require("idris2.code_action").add_clause()<CR>', vim.tbl_extend('force', opts, { desc = 'Add Clause' }))
                      vim.keymap.set('n', '<M-c><M-c>', '<cmd>lua require("idris2.code_action").case_split()<CR>', vim.tbl_extend('force', opts, { desc = 'Case Split' }))
                      vim.keymap.set('n', '<M-c><M-m>', '<cmd>lua require("idris2.code_action").make_case()<CR>', vim.tbl_extend('force', opts, { desc = 'Make Case' }))
                      vim.keymap.set('n', '<M-c><M-w>', '<cmd>lua require("idris2.code_action").make_with()<CR>', vim.tbl_extend('force', opts, { desc = 'Make With' }))
                      vim.keymap.set('n', '<M-c><M-l>', '<cmd>lua require("idris2.code_action").make_lemma()<CR>', vim.tbl_extend('force', opts, { desc = 'Make Lemma' }))
                      vim.keymap.set('n', '<M-c><M-s>', '<cmd>lua require("idris2.code_action").expr_search()<CR>', vim.tbl_extend('force', opts, { desc = 'Expression Search' }))
                      vim.keymap.set('n', '<M-c><M-e>', '<cmd>lua require("idris2.repl").evaluate()<CR>', vim.tbl_extend('force', opts, { desc = 'Evaluate Expression' }))
                      vim.keymap.set('n', '<M-c><M-d>', '<cmd>lua require("idris2.browse").browse()<CR>', vim.tbl_extend('force', opts, { desc = 'Browse Namespace' }))
                      vim.keymap.set('n', '<M-c><M-v>', '<cmd>lua require("idris2.metavars").request_all()<CR>', vim.tbl_extend('force', opts, { desc = 'Show Metavariables' }))
                      vim.keymap.set('n', '<M-c><M-f>', '<cmd>lua require("idris2.code_action").generate_def()<CR>', vim.tbl_extend('force', opts, { desc = 'Generate Definition' }))
                      vim.keymap.set('n', '<M-c><M-r>', '<cmd>lua require("idris2.code_action").refine_hole()<CR>', vim.tbl_extend('force', opts, { desc = 'Refine hole' }))
                      vim.keymap.set('n', '<M-c><M-i>', '<cmd>lua require("idris2.code_action").intro()<CR>', vim.tbl_extend('force', opts, { desc = 'Intros' }))

                      vim.keymap.set('n', '<M-c><M-t>', '<cmd> lua vim.lsp.buf.hover()<CR>', vim.tbl_extend('force', opts, { desc = 'Show Type' }))
                      
                      -- Navigation between metavars
                      vim.keymap.set('n', '<M-c><M-n>', '<cmd>lua require("idris2.metavars").goto_next()<CR>', vim.tbl_extend('force', opts, { desc = 'Next Metavariable' }))
                      vim.keymap.set('n', '<M-c><M-p>', '<cmd>lua require("idris2.metavars").goto_prev()<CR>', vim.tbl_extend('force', opts, { desc = 'Previous Metavariable' }))
                  end
                '';
              };
            }
          ];
        };
      };
    };
}
