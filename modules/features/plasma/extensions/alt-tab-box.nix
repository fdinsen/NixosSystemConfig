{ ... }:
{
  home.plasma.extensions.alt-tab-box =
    { ... }:
    {
      programs.plasma.configFile.kwinrc = {
        "TabBox" = {
          LayoutName = "thumbnail_grid";
        };
      };
    };
}
