{ self, lib, ... }:
{
  flake.nixvimLangs.rocq =
    { config, pkgs, ... }:
    let
      cfg = config.custom.nixvimLangs.rocq;
    in
    {
      options.custom.nixvimLangs.rocq = {
        enable = lib.mkEnableOption "nixvimLangs.rocq";
      };
      config = lib.mkIf cfg.enable {
        programs.nixvim = {
          extraPlugins = [
            self.packages.${pkgs.system}.coqtail
          ];
          lsp.servers.coq_lsp = {
            enable = true;
            package = null;
            config = {
              rocqpath = [ "${pkgs.rocq-core}/lib/coq/user-contrib" ];
            };
          };
        };
      };
    };
}
