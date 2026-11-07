{
  config,
  lib,
  ...
}:
let
  theme = config.lib.assets.rofiThemes.roundedGlass;
in
{
  home.desktop.rofi =
    { pkgs, config, ... }:
    {
      programs.rofi = {
        inherit theme;
        enable = true;
        package = pkgs.rofi;
        plugins = [
          pkgs.rofi-emoji
        ];
        settings = {
          modes = [
            "drun"
            "window"
            "ssh"
            "emoji"
            "combi"
            "keys"
          ];
          terminal = "kitty";
          show-icons = true;
        };
      };
      programs.plasma = lib.mkIf config.programs.plasma.enable {
        # unbind Meta
        shortcuts.plasmashell."activate application launcher" = "none";
        hotkeys.commands = {
          show-rofi = {
            name = "Show Rofi drun";
            key = "Meta";
            command = "rofi -show drun";
          };
          show-rofi-emoji = {
            name = "Show Rofi emoji";
            key = "Meta+.";
            command = "rofi -modi emoji -show emoji";
          };
        };
      };
    };
}
