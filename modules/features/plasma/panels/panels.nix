{ lib, ... }:
{
  home.plasma.panels.panels =
    { config, ... }:
    let
      inherit (config.plasma-widgets)
        panel-colorizer
        kara
        windowtitle
        systemtray
        icontasks
        ;
    in
    {
      options.plasma-panels = lib.mkOption {
        default = { };
        type = lib.types.lazyAttrsOf (lib.types.listOf lib.types.raw);
      };

      config.plasma-panels = rec {
        left-short = [
          panel-colorizer
          windowtitle
        ];
        left = left-short ++ [
          "org.kde.plasma.marginsseparator"
          "plasmusic-toolbar"
        ];
        middle = [
          icontasks
          panel-colorizer
        ];

        right = [
          systemtray
          "org.kde.plasma.marginsseparator"
          kara
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.digitalclock"
          panel-colorizer
        ];
      };
    };
}
