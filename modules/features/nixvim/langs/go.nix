{ lib, ... }:
{
  flake.nixvimLangs.go =
    { config, pkgs, ... }:
    let
      cfg = config.custom.nixvimLangs.go;
    in
    {
      options.custom.nixvimLangs.go = {
        enable = lib.mkEnableOption "nixvimLangs.go";
      };
      config = lib.mkIf cfg.enable {
        programs.nixvim = {
          lsp.servers.gopls = {
            enable = true;
          };
        };
      };
    };
}
