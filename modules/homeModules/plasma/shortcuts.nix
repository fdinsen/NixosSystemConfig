{ ... }:
{
  flake.plasmaHome.base.shortcuts =
    { ... }:
    {
      programs.plasma.shortcuts = {
        ksmserver = {
          "Lock Session" = [
            "Meta+Ctrl+Shift+Alt+L"
            "Screensaver"
            "Lock Session"
          ];
        };
      };
    };
}
