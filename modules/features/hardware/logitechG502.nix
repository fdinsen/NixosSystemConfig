{ ... }:
{
  nixos.hardware.logitechG502 =
    { pkgs, ... }:
    {
      nixpkgs.overlays = [
        (final: prev: {
          libratbag = prev.libratbag.overrideAttrs (old: {
            src = prev.fetchFromGitHub {
              owner = "libratbag";
              repo = "libratbag";
              rev = "c5214d26336695d1414a6b4e32697f5b5a835089";
              hash = "sha256-o1lsdJ8QwprpBVUdntjjfV6lPaqhG0rD9ySjf+LXriQ=";
            };
          });
        })
      ];
      services.ratbagd.enable = true;

      environment.systemPackages = with pkgs; [
        solaar # logitech mouse configuration
        piper
      ];
    };
  home.hardware.logitechG502 =
    { ... }:
    {
      programs.plasma.input = {
        mice = [
          {
            acceleration = -0.8;
            accelerationProfile = "none";
            name = "Logitech G502 X Plus";
            productId = "c095";
            vendorId = "046d";
            naturalScroll = false;
          }
        ];
      };
    };
}
