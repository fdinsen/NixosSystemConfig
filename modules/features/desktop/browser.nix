{
  lib,
  config,
  self,
  ...
}:
{
  nixos.desktop.browser =
    { pkgs, ... }:
    let
      zen-browser = self.packages.${pkgs.stdenv.hostPlatform.system}.zen-browser-wrapped;
    in
    {
      programs.firefox.enable = true;

      environment.systemPackages = [
        zen-browser
      ];
    };

  home.desktop.browser = {
    xdg.configFile."mimeapps.list".force = true;
    xdg = {
      enable = true;
      mimeApps = {
        enable = true;
        defaultApplications = {
          "text/html" = "zen.desktop";
          "x-scheme-handler/http" = "zen.desktop";
          "x-scheme-handler/https" = "zen.desktop";
        };
      };
    };
  };
}
