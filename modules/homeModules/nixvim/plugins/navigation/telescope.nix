{ ... }:
{
  # Fuzzy finder (project search)
  flake.nixvimPlugins.navigation.telescope =
    { ... }:
    {
      programs.nixvim = {
        plugins.telescope = {
          enable = true;
        };
        keymaps = [
          {
            key = "<leader>f";
            options.desc = "Find";
            action = "";
          }
          {
            key = "<leader>ff";
            options.desc = "Find Files";
            action = ":Telescope find_files<CR>";
          }
          {
            key = "<leader>fg";
            options.desc = "Find in Files";
            action = ":Telescope live_grep<CR>";
          }
          {
            key = "<leader>fb";
            options.desc = "Find in Buffers";
            action = ":Telescope buffers<CR>";
          }
        ];
      };
    };
}
