{ lib, ... }:
{
  flake.nixvimLangs.haskell =
    { config, pkgs, ... }:
    let
      cfg = config.custom.nixvimLangs.haskell;
    in
    {
      options.custom.nixvimLangs.haskell = {
        enable = lib.mkEnableOption "nixvimLangs.haskell";
      };
      config = lib.mkIf cfg.enable {
        programs.nixvim = {
          lsp.servers.hls = {
            enable = true;
            package = pkgs.haskell-language-server.override {
              supportedGhcVersions = [
                "912"
                "910"
              ];
            };
            config.haskell = {
              formattingProvider = "ormolu";
              plugin = {
                ghcide-completions.config.autoExtendOn = true;
                ghcide-type-lenses.config.mode = "always";
                importLens.globalOn = true;
                class.globalOn = true;
                eval.globalOn = true;
                splice.globalOn = true;
                pragmas.globalOn = true;
                moduleName.globalOn = true;
                semanticTokens.globalOn = true;
              };
            };
          };
        };
      };
    };
}
