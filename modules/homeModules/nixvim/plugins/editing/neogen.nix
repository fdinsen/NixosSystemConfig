{ ... }:
# TODO: Consider making neogen templates depend on the languages installed
{
  # annotation generator
  flake.nixvimPlugins.editing.neogen =
    { pkgs, ... }:
    {
      programs.nixvim = {
        plugins.neogen = {
          enable = true;
          settings = {
            languages = {
              python.template.annotation_convention = "google_docstrings";
              rust.template.annotation_convention = "rustdoc";
            };
          };
        };
        keymaps = [
          {
            key = "<leader>g";
            options.desc = "Generate Docstring";
            action = "";
          }
          {
            key = "<leader>gc";
            options.desc = "Generate Class Docs";
            action = ":Neogen class<CR>";
          }
          {
            key = "<leader>gf";
            options.desc = "Generate Func Docs";
            action = ":Neogen func<CR>";
          }
          {
            key = "<leader>gt";
            options.desc = "Generate Type Docs";
            action = ":Neogen type<CR>";
          }
          {
            key = "<leader>gg";
            options.desc = "Generate File Docs";
            action = ":Neogen file<CR>";
          }
        ];
      };
    };
}
