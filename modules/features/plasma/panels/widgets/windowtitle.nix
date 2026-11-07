{ ... }:
{
  home.plasma.widgets =
    { ... }:
    {
      plasma-widgets.windowtitle = {
        name = "org.kde.windowtitle";
        config = {
          Appearance = {
            activityIcon = false;
            altTxt = "Desktop";
            customIcon = "user-desktop-symbolic";
            fixedLength = 400;
            lengthKind = 2; # maximum length
          };
        };
      };
    };
}
