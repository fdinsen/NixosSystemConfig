{ ... }:
{
  flake.homeModules."nixvim.colorschemes.everforest" =
    { ... }:
    {
      programs.nixvim = {
        colorschemes.everforest = {
          enable = true;
          settings = {
            transparent_background = 1;
            styles = {
              sidebars = "transparent";
              floats = "transparent";
            };
          };
        };
        highlightOverride = {
          NormalFloat = {
            bg = "NONE";
          };
          FloatBorder = {
            bg = "NONE";
          };
        };
      };
    };
}
