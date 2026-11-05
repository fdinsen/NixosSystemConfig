{ ... }:
{
  flake.nixvimPlugins.ui.lualine = { ... }: {
    programs.nixvim = {
      plugins.lualine = {
        enable = true;
        settings = {
          options = {
            # theme = "codedark";
          };
        };
      };
    };
  };
}
