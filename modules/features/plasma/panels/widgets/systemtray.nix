{ ... }:
{
  home.plasma.widgets =
    { ... }:
    {
      plasma-widgets.systemtray = {
        name = "org.kde.plasma.systemtray";
        config = {
          General = {
            extraItems = builtins.concatStringsSep "," [
              "org.kde.plasma.manage-inputmethod"
              "org.kde.plasma.devicenotifier"
              "org.kde.plasma.cameraindicator"
              "org.kde.plasma.notifications"
              "org.kde.plasma.keyboardlayout"
              "org.kde.plasma.printmanager"
              "org.kde.kscreen"
              "org.kde.plasma.keyboardindicator"
              "org.kde.plasma.networkmanagement"
              "org.kde.plasma.battery"
              "org.kde.plasma.volume"
              "org.kde.plasma.clipboard"
            ];
            hiddenItems = builtins.concatStringsSep "," [
              "org.kde.plasma.clipboard"
            ];
            knownItems = builtins.concatStringsSep "," [
              "org.kde.plasma.manage-inputmethod"
              "org.kde.plasma.devicenotifier"
              "org.kde.plasma.clipboard"
              "org.kde.plasma.cameraindicator"
              "org.kde.plasma.notifications"
              "org.kde.plasma.mediacontroller"
              "org.kde.plasma.keyboardlayout"
              "org.kde.plasma.printmanager"
              "org.kde.kscreen"
              "org.kde.plasma.keyboardindicator"
              "org.kde.plasma.networkmanagement"
              "org.kde.plasma.volume"
              "org.kde.plasma.weather"
              "org.kde.plasma.brightness"
              "org.kde.plasma.battery"
            ];
            shownItems = builtins.concatStringsSep "," [
              "org.kde.plasma.volume"
            ];
            iconSpacing = 6;
          };
        };
      };
    };
}
