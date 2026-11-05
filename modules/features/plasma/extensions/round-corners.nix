{ ... }:
{
  home.plasma.extensions.round-corners = { pkgs, ... }: {
    home.packages = [
      pkgs.kde-rounded-corners
    ];
    programs.plasma.configFile.kwinrc = {
      # TODO: Should this not also be enabled in Plugins.something?
      "Round-Corners" = {
        ActiveOutlineUseCustom = false;
        ActiveOutlineUsePalette = true;
        DisableOutlineFullScreen = true;
        DisableOutlineMaximize = false;
        DisableOutlineTile = false;
        DisableRoundTile = false;
        Size = 15;
        InactiveCornerRadius = 15;
      };
      "org.kde.kdecoration2" = {
        BorderSize = "None";
        BorderSizeAuto = false;
      };
    };
  };
}
