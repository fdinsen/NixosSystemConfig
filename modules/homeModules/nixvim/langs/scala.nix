{ lib, ... }:
{
  flake.nixvimLangs.scala =
    { config, ... }:
    let
      cfg = config.custom.nixvimLangs.scala;
    in
    {
      options.custom.nixvimLangs.scala = {
        enable = lib.mkEnableOption "nixvimLangs.scala";
      };
      config = lib.mkIf config.custom.nixvimLangs.scala.enable {
        programs.nixvim = {
          lsp.servers.metals = {
            enable = true;
          };
        };
      };
    };
}
