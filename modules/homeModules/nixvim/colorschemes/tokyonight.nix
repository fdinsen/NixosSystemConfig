{ ... }:
{
  flake.homeModules."nixvim.colorschemes.tokyonight" = 
    { ... }:
    {
      programs.nixvim.colorschemes.tokyonight = {
        enable = true;
        settings = {
          light_style = "night";
          style = "moon";
          transparent = true;
          styles = {
            sidebars = "transparent";
            floats = "transparent";
          };
          terminal_colors = true;
        };
      };
    };
}
