{ ... }:
{
  flake.plasmaHome.extensions.virtualDesktops =
    { ... }:
    {
      programs.plasma = {
        kwin.virtualDesktops = {
          number = 4;
          names = [
            "Top Left Desktop"
            "Top Right Desktop"
            "Bottom Left Desktop"
            "Bottom Right Desktop"
          ];
          rows = 2;
        };
        shortcuts.kwin = {
          "Window One Screen Up" = [
            "Meta+Alt+K"
            "Meta+Alt+Up"
          ];
          "Window One Screen Down" = [
            "Meta+Alt+J"
            "Meta+Alt+Down"
          ];
          "Window One Screen to the Left" = [
            "Meta+Alt+H"
            "Meta+Alt+Left"
          ];
          "Window One Screen to the Right" = [
            "Meta+Alt+L"
            "Meta+Alt+Right"
          ];

          "Switch One Desktop Up" = [
            "Meta+Ctrl+Up"
            "Meta+Ctrl+K"
          ];
          "Switch One Desktop Down" = [
            "Meta+Ctrl+Down"
            "Meta+Ctrl+J"
          ];
          "Switch One Desktop to the Left" = [
            "Meta+Ctrl+Left"
            "Meta+Ctrl+H"
          ];
          "Switch One Desktop to the Right" = [
            "Meta+Ctrl+Right"
            "Meta+Ctrl+L"
          ];

          "Window One Desktop Up" = [
            "Meta+Ctrl+Shift+Up"
            "Meta+Ctrl+Shift+K"
          ];
          "Window One Desktop Down" = [
            "Meta+Ctrl+Shift+Down"
            "Meta+Ctrl+Shift+J"
          ];
          "Window One Desktop to the Left" = [
            "Meta+Ctrl+Shift+Left"
            "Meta+Ctrl+Shift+H"
          ];
          "Window One Desktop to the Right" = [
            "Meta+Ctrl+Shift+Right"
            "Meta+Ctrl+Shift+L"
          ];

          "Window to Previous Screen" = [ "none" ];
          "Window to Next Screen" = [ "none" ];

          "Switch Window Left" = [ "none" ];
          "Switch Window Right" = [ "none" ];
          "Switch Window Up" = [ "none" ];
          "Switch Window Down" = [ "none" ];
        };
        shortcuts."KDE Keyboard Layout Switcher" = {
          "Switch to Last-Used Keyboard Layout" = [ "none" ];
          "Switch to Next Keyboard Layout" = [ "none" ];
        };
      };
    };
}
