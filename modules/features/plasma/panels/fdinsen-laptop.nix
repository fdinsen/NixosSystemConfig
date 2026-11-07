{ config, ... }:
let
  flake-config = config;
  inherit (flake-config.lib.plasma) makeTopPanel;
in
{
  home.plasma.panels.fdinsen-laptop =
    { config, ... }:
    let
      inherit (config.plasma-panels) left middle right;
    in
    {
      programs.plasma.panels = [
        (makeTopPanel "left" "all" 950 left)
        (makeTopPanel "center" "all" null middle)
        (makeTopPanel "right" "all" null right)
      ];
    };

  flake.homeModules.plasma-panels-laptop = config.home.plasma.panels.fdinsen-laptop;
}
