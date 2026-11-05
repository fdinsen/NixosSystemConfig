{ self, lib, ... }:
{
  home.nixvim.langs.rocq = { pkgs, ... }: {
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
}
