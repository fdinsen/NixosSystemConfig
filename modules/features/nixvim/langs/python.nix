{ self, lib, ... }:
{
  home.nixvim.langs.python = { pkgs, ... }: {
    programs.nixvim = {
      lsp.servers.pylsp = {
        enable = true;
      };
      extraPlugins = [
        self.packages.${pkgs.stdenv.hostPlatform.system}."mypy.nvim"
      ];
    };
  };
}
