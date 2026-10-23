{ ... }:
{
  flake.homeModules."nixvim.keymaps" =
    { ... }:
    {
      programs.nixvim.keymaps = [
        # Splits
        # create splits
        {
          key = "<leader>s";
          options.desc = "Splits";
          action = "";
        }
        {
          key = "<leader>sv";
          options.desc = "Split Vertically";
          action = ":vsplit<CR>";
        }
        {
          key = "<leader>sh";
          options.desc = "Split Horizontally";
          action = ":split<CR>";
        }
        # move between splits
        {
          mode = "n";
          key = "<C-h>";
          action = "<C-w>h";
        }
        {
          mode = "n";
          key = "<C-j>";
          action = "<C-w>j";
        }
        {
          mode = "n";
          key = "<C-k>";
          action = "<C-w>k";
        }
        {
          mode = "n";
          key = "<C-l>";
          action = "<C-w>l";
        }

        # Move lines
        {
          mode = "n";
          key = "<A-j>";
          action = ":m .+1<CR>==";
        }
        {
          mode = "n";
          key = "<A-k>";
          action = ":m .-2<CR>==";
        }
        {
          mode = "v";
          key = "<A-j>";
          action = ":m '>+1<CR>gv=gv";
        }
        {
          mode = "v";
          key = "<A-k>";
          action = ":m '<-2<CR>gv=gv";
        }

        # Save
        {
          mode = "n";
          key = "<C-s>";
          action = ":w<CR>";
        }
        {
          mode = "v";
          key = "<C-s>";
          action = ":w<CR>";
        }

        # Error Diagnostics
        {
          mode = "n";
          key = "<leader>e";
          action.__raw = "vim.diagnostic.open_float";
          options.desc = "Error Diagnostics";
        }
      ];
    };
}
