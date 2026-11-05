{ lib, ... }:
{
  home.nixvim.langs.rust = {
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
}
