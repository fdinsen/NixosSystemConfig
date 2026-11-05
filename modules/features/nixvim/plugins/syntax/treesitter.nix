{ ... }:
{
  home.nixvim.plugins.syntax.treesitter =
    { ... }:
    {
      programs.nixvim = {
        plugins.treesitter = {
          enable = true;
          settings = {
            highlight.enable = true;
            indent.enable = true;
          };
        };
      };
    };
}
