{ lib, ... }:
{
  flake.nixvimLangs.java =
    { config, ... }:
    let
      cfg = config.custom.nixvimLangs.java;
    in
    {
      options.custom.nixvimLangs.java = {
        enable = lib.mkEnableOption "nixvimLangs.java";
      };
      config = lib.mkIf config.custom.nixvimLangs.java.enable {
        programs.nixvim = {
          plugins.jdtls = {
            enable = true;
            settings = {
              java = {
                signatureHelp.enabled = true;
              };
            };
          };
        };
      };
    };
}
