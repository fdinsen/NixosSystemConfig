{ ... }:
{
  flake.homeModules.alacritty =
    { ... }:
    {
      programs.alacritty = {
        enable = true;
        settings = {
          window = {
            opacity = 0.75;
            padding = {
              x = 4;
              y = 4;
            };
            dynamic_padding = true;
          };
        };
      };
    };
}
