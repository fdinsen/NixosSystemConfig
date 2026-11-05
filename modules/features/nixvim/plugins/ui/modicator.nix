{ ... }:
{

  # Line number color
  flake.nixvimPlugins.ui.modicator =
    { ... }:
    {
      programs.nixvim = {
        plugins.modicator = {
          enable = true;
          settings = {
            integration.lualine.enabled = true;
          };
        };
      };
    };
}
