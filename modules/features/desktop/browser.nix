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
}
