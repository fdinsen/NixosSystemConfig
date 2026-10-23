{ ... }:
{
  flake.homeModules.kitty =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [ fira-code ];
      programs.kitty = {
        enable = true;
        settings = {
          background_opacity = "0.70";
          window_padding_width = 2;
          cursor_trail = 3;
          cursor_trail_decay = "0.1 0.2";
          hide_window_decorations = "titlebar-only";
        };
        font = {
          name = "Fira Code";
          size = 12;
        };
        themeFile = "1984_orwellian";
      };
    };
}
