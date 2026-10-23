{ ... }:
{
  flake.plasmaHome.input.logitechG502 =
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
