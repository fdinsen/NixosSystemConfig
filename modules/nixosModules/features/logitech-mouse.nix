{ ... }:
{
  flake.nixosModules.logitech-mouse =
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
}
