{ ... }:
{
  # Togglable terminal
  flake.nixvimPlugins.ui.toggleterm =
    { ... }:
    {
      programs.nixvim = {
        plugins.toggleterm = {
          enable = true;
          settings = {
            open_mapping = "[[<c-\\>]]";
            float_opts = {
              border = "curved";
            };
          };
        };
        keymaps = [
          # Opening terminals
          {
            key = "<leader>t";
            options.desc = "Terminal";
            action = "";
          }
          {
            key = "<leader>tt";
            options.desc = "Open Terminal";
            action = ":1ToggleTerm<CR>";
          }
          {
            key = "<leader>tf";
            options.desc = "Open Floating Terminal";
            action = ":2ToggleTerm direction=float<CR>";
          }
          {
            key = "<leader>th";
            options.desc = "Open Horizontal Terminal";
            action = ":3ToggleTerm direction=horizontal<CR>";
          }
          {
            key = "<leader>tv";
            options.desc = "Open Vertical Terminal";
            action = ":4ToggleTerm direction=vertical<CR>";
          }

          # Terminal Navigation
          {
            mode = "t";
            key = "<Esc>";
            action = "<C-\\><C-n>";
          }
          {
            mode = "t";
            key = "<C-h>";
            action = "<C-\\><C-n><C-W>h";
          }
          {
            mode = "t";
            key = "<C-j>";
            action = "<C-\\><C-n><C-W>j";
          }
          {
            mode = "t";
            key = "<C-k>";
            action = "<C-\\><C-n><C-W>k";
          }
          {
            mode = "t";
            key = "<C-l>";
            action = "<C-\\><C-n><C-W>l";
          }
          # {
          #   mode = "t";
          #   key = "<C-u>";
          #   action = "<C-\\><C-n><C-u>";
          # }
          # {
          #   mode = "t";
          #   key = "<C-d>";
          #   action = "<C-\\><C-n><C-d>";
          # }
          {
            mode = "t";
            key = "<C-d>";
            action = "<C-\\><C-n><C-w>q";
            options.desc = "Detach terminal (keep alive, close window)";
          }

          # Reattaching
          {
            mode = "n";
            key = "<leader>t1";
            action = ":1ToggleTerm<CR>";
            options.desc = "Reopen Terminal 1";
          }
          {
            mode = "n";
            key = "<leader>t2";
            action = ":2ToggleTerm<CR>";
            options.desc = "Reopen Terminal 2";
          }
          {
            mode = "n";
            key = "<leader>t3";
            action = ":3ToggleTerm<CR>";
            options.desc = "Reopen Terminal 3";
          }
          {
            mode = "n";
            key = "<leader>t4";
            action = ":4ToggleTerm<CR>";
            options.desc = "Reopen Terminal 4";
          }
          {
            mode = "n";
            key = "<leader>t5";
            action = ":5ToggleTerm<CR>";
            options.desc = "Reopen Terminal 5";
          }
          {
            mode = "n";
            key = "<leader>ts";
            action = ":TermSelect";
            options.desc = "Open Terminal Selector";
          }

        ];
      };
    };
}
