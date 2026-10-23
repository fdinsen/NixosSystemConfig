{ lib, ... }:
let
  preferredAppsList = [
    "browser"
    "filemanager"
    "mailer"
    "terminal"
  ];
  pinnableAppsList = [
    "kitty"
    "alacritty"
    "md.obsidian.Obsidian"
    "slack"
    "steam"
    "element-desktop"
  ];
in
{
  flake.lib.plasma = rec {
    types = {
      preferredApps = lib.types.enum preferredAppsList;
      pinnableApps = lib.types.enum (preferredAppsList ++ pinnableAppsList);
    };

    isPreferred = app: builtins.elem app preferredAppsList;
    appToKdeShape =
      app: if isPreferred app then "preferred://${app}" else "applications:${app}.desktop";
    appsToKdeShape = map appToKdeShape;
  };
}
