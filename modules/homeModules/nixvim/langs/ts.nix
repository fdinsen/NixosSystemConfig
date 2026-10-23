{ lib, ... }:
{
  flake.nixvimLangs.ts =
    { config, ... }:
    let
      cfg = config.custom.nixvimLangs.ts;
    in
    {
      options.custom.nixvimLangs.ts = {
        enable = lib.mkEnableOption "nixvimLangs.ts";
      };
      config = lib.mkIf config.custom.nixvimLangs.scala.enable {
        programs.nixvim.lsp.servers.ts_ls.enable = true;
      };
    };
}
