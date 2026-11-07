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
  options.lib.plasma = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.raw;
    default = { };
    description = "Shared library of plasma functions, merged from across the modules tree.";
  };

  config.lib.plasma = rec {
    types = {
      preferredApps = lib.types.enum preferredAppsList;
      pinnableApps = lib.types.enum (preferredAppsList ++ pinnableAppsList);
    };

    isPreferred = app: builtins.elem app preferredAppsList;
    appToKdeShape =
      app: if isPreferred app then "preferred://${app}" else "applications:${app}.desktop";
    appsToKdeShape = map appToKdeShape;
    makePanel = location: alignment: screen: maxLength: widgets: {
      inherit
        location
        alignment
        screen
        maxLength
        widgets
        ;
      floating = true;
      height = 40;
      lengthMode = "fit";
      opacity = "translucent";
    };
    makeTopPanel = makePanel "top";
  };
}
