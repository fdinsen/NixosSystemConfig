{ lib, ... }:
{
  home.nixvim.langs.scala = {
    programs.nixvim = {
      lsp.servers.metals = {
        enable = true;
      };
    };
  };
}
