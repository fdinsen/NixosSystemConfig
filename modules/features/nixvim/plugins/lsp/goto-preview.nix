{ ... }:
{
  flake.nixvimPlugins.lsp.goto-preview =
    { ... }:
    {
      programs.nixvim = {
        plugins.goto-preview = {
          enable = true;
        };
        keymaps = [
          {
            mode = "n";
            key = "gpd";
            action = "<cmd>lua require('goto-preview').goto_preview_definition()<CR>";
          }
          {
            mode = "n";
            key = "gpt";
            action = "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>";
          }
          {
            mode = "n";
            key = "gpi";
            action = "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>";
          }
          {
            mode = "n";
            key = "gpD";
            action = "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>";
          }
          {
            mode = "n";
            key = "gP";
            action = "<cmd>lua require('goto-preview').close_all_win()<CR>";
          }
          {
            mode = "n";
            key = "gpr";
            action = "<cmd>lua require('goto-preview').goto_preview_references()<CR>";
          }
        ];
      };
    };
}
