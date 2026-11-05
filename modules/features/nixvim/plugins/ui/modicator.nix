{ ... }:
{

  # Line number color
  home.nixvim.plugins.ui.modicator =
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
