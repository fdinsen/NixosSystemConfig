{ lib, ... }:
{
  flake.nixvimLangs.rust =
    { config, ... }:
    let
      cfg = config.custom.nixvimLangs.rust;
    in
    {
      options.custom.nixvimLangs.rust = {
        enable = lib.mkEnableOption "nixvimLangs.rust";
      };
      config = lib.mkIf cfg.enable {
        programs.nixvim.plugins = {
          rustaceanvim = {
            enable = true;

            settings = {
              server = {
                default_settings = {
                  "rust-analyzer" = {
                    cargo.allFeatures = true;
                  };
                };
              };
            };
          };
          crates = {
            enable = true;
          };
        };
      };
    };
}
