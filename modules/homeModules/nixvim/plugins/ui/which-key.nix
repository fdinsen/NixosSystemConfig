{ ... }:
{
  flake.nixvimPlugins.ui.which-key =
    { ... }:
    {
      programs.nixvim = {
        plugins.which-key = {
          enable = true;
          settings = {
            win.border = "rounded";
          };
        };
      };
    };
}
