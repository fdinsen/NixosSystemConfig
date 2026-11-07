{ config, ... }:
let
  flake-config = config;
  inherit (flake-config.lib.plasma) makeTopPanel;
in
{
  home.plasma.panels.fdinsen-desktop =
    { config, ... }:
    let
      inherit (config.plasma-panels)
        left
        middle
        right
        left-short
        ;

      landscapeMonitors = [
        0
        1
      ];
      portraitMonitors = 2;
    in
    {
      programs.plasma.panels = [
        (makeTopPanel "left" landscapeMonitors 950 left)
        (makeTopPanel "center" "all" null middle)
        (makeTopPanel "right" landscapeMonitors null right)

        (makeTopPanel "left" portraitMonitors 430 left-short)
        (makeTopPanel "right" portraitMonitors 430 right)
      ];
    };
}
