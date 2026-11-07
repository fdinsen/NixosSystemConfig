{ config, ... }:
let
  flake-config = config;
in
{
  home.plasma.widgets =
    { config, ... }:
    let
      inherit (config.custom.plasma.panels) pinnedApps;
      pinnedAppsKde = flake-config.lib.plasma.appsToKdeShape pinnedApps;
    in
    {
      plasma-widgets.icontasks = {
        name = "org.kde.plasma.icontasks";
        config = {
          General = {
            iconSpacing = 3;
            launchers = builtins.concatStringsSep "," pinnedAppsKde;
          };
        };
      };
    };
}
