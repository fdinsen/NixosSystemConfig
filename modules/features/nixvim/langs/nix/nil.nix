{ lib, ... }:
{
  home.nixvim.langs.nix-nil = {
    programs.nixvim.lsp.servers.nil_ls = {
      enable = true;
    };
  };
}
