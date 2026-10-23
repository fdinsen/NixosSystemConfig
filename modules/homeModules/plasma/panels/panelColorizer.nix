# flake-parts module. Registers flake.homeModules.plasma-panel-colorizer:
# a home-manager module for declaratively injecting bundled
# luisbocanegra/plasma-panel-colorizer *presets* (themes), independent from
# plasma-manager's per-panel instance config.
#
# Panel Colorizer reads presets from:
#   ~/.config/panel-colorizer/presets/<PresetName>/settings.json
#   ~/.config/panel-colorizer/presets/<PresetName>/preview.png   (optional)
#
# plasma-manager can pick which preset a given panel widget uses, but it has
# no notion of the preset *files themselves* -- that's what this module
# manages. Presets are plain settings.json files you export from the
# widget's own settings UI and check into your config repo; this module just
# copies them verbatim into place (with a build-time sanity check) and
# exposes their resolved absolute paths so other modules can reference a
# preset by name instead of a hand-typed path.
#
# Usage (in a home-manager config that imports self.homeModules.plasma-panel-colorizer):
#
#   programs.plasma-panel-colorizer.enable = true;
#   programs.plasma-panel-colorizer.presets.DockTheme = {
#     source = ./themes/dock-theme-settings.json;
#     preview = ./themes/dock-theme-preview.png; # optional
#   };
#
#   # elsewhere, to reference it (e.g. from panels.nix):
#   config.programs.plasma-panel-colorizer.presetPaths.DockTheme
#   # -> "/home/you/.config/panel-colorizer/presets/DockTheme"
#
{ ... }:
{
  flake.homeModules.plasma-panel-colorizer =
    {
      config,
      lib,
      pkgs,
      ...
    }:

    with lib;

    let
      cfg = config.programs.plasma-panel-colorizer;
    in
    {
      options.programs.plasma-panel-colorizer = {
        enable = mkEnableOption "declarative Plasma Panel Colorizer presets";

        presets = mkOption {
          default = { };
          description = ''
            Panel Colorizer presets, keyed by preset name, defined as raw
            settings.json files bundled with your Nix config and injected
            verbatim into ~/.config/panel-colorizer/presets/<name>/.
          '';
          type = types.attrsOf (
            types.submodule {
              options = {
                source = mkOption {
                  type = types.path;
                  description = ''
                    Path to a bundled panel-colorizer settings.json (e.g.
                    exported from the widget's own settings UI and checked into
                    your config repo). Copied in verbatim.
                  '';
                };
                preview = mkOption {
                  type = types.nullOr types.path;
                  default = null;
                  description = "Optional preview.png for the preset picker.";
                };
              };
            }
          );
        };

        # No `default` here on purpose: this is `readOnly` and computed once
        # in `config` below. Giving it a `default` too would make the module
        # system see two definitions for a read-only option, which is an error.
        presetPaths = mkOption {
          type = types.attrsOf types.str;
          readOnly = true;
          description = ''
            Read-only: absolute runtime path (e.g.
            "/home/you/.config/panel-colorizer/presets/Foo") for every preset
            declared in `presets`, keyed by name. Panel Colorizer's own widget
            config (lastPreset / presetAutoloading) identifies presets by this
            full directory path rather than by bare name -- use this instead
            of hand-writing the path yourself. A typo'd or undeclared name
            fails at eval time instead of silently doing nothing.
          '';
        };
      };

      config = mkIf cfg.enable {
        programs.plasma-panel-colorizer.presetPaths = mapAttrs (
          name: _: "${config.xdg.configHome}/panel-colorizer/presets/${name}"
        ) cfg.presets;

        xdg.configFile = mkMerge (
          mapAttrsToList (
            name: preset:
            let
              dir = "panel-colorizer/presets/${name}";
              # Parse at eval time purely to validate the file -- fail the
              # build with a clear error instead of shipping broken JSON to
              # Plasma.
              parsed = builtins.fromJSON (builtins.readFile preset.source);
              checked =
                if parsed ? globalSettings then
                  preset.source
                else
                  throw ''
                    plasma-panel-colorizer preset "${name}" (${toString preset.source})
                    has no top-level "globalSettings" key -- this doesn't look
                    like a valid Panel Colorizer settings.json export.
                  '';
            in
            {
              "${dir}/settings.json".source = checked;
            }
            // optionalAttrs (preset.preview != null) {
              "${dir}/preview.png".source = preset.preview;
            }
          ) cfg.presets
        );
      };
    };
}
