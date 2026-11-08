{ config, ... }:
let
  flake-config = config;
in
{
  home.plasma.widgets =
    { config, ... }:
    let
      inherit (config.plasma-workspace) pinnedApps;
      pinnedAppsKde =
        flake-config.lib.plasma.buildPrioritisedPreferredApps pinnedApps
        |> flake-config.lib.plasma.appsToKdeShape;
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
