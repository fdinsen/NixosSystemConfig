{ lib, ... }:
{
  home.nixvim.langs.go = {
    programs.nixvim = {
      lsp.servers.gopls = {
        enable = true;
      };
    };
  };
}
