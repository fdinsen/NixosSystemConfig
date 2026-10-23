{ ... }:
{
  flake.nixosModules.fonts = { pkgs, ... }: {
    fonts.fontDir.enable = true;
    environment.systemPackages = with pkgs; [
      freefont_ttf
      arphic-uming
      baekmuk-ttf
    ];
  };
}
