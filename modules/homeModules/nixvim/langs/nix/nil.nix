{ lib, ... }:
{
  flake.nixvimLangs.nix-nil =
    { config, ... }:
    let
      cfg = config.custom.nixvimLangs.nix-nil;
    in
    {
      options.custom.nixvimLangs.nix-nil = {
        enable = lib.mkEnableOption "nixvimLangs.nix-nil";
      };

      config = lib.mkIf cfg.enable {
        programs.nixvim.lsp.servers.nil_ls = {
          enable = true;
        };
      };
    };
}
