{ lib, config, ... }:
{
  options.home.plasma.panels = lib.mkOption {
    default = { };
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };

  options.nixos.plasma.panels = lib.mkOption {
    default = { };
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
  };

  config.home.plasma.panels.default = {
    options.plasma-workspace = {
      panelColorizerPreset = lib.mkOption {
        type = lib.types.str;
        description = "Path to the panel-colorizer preset.";
        default = "DockTheme";
      };
      pinnedApps = lib.mkOption {
        type = lib.types.listOf (
          lib.types.submodule {
            options = {
              name = lib.mkOption { type = config.lib.plasma.types.pinnableApps; };
              priority = lib.mkOption {
                type = lib.types.int;
                default = 1000;
              };
            };
          }
        );
        default = [ ];
        description = "List of apps to pin to taskbar";
      };
    };
  };
}
