{ lib, ... }:
{
  home.nixvim.langs.ts = {
    programs.nixvim.lsp.servers.ts_ls.enable = true;
  };
}
