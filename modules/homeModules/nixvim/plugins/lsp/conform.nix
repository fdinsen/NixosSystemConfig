{ lib, ... }:
{
  # Lightweight yet powerful formatter plugin for Neovim.
  # https://nix-community.github.io/nixvim/plugins/conform-nvim/index.html
  flake.nixvimPlugins.lsp.conform =
    { pkgs, ... }:
    {
      programs.nixvim = {
        plugins.conform-nvim = {
          enable = true;
          settings = {
            formatters_by_ft = {
              "_" = [
                "squeeze_blanks"
                "trim_whitespace"
                "trim_newlines"
              ];
              "nix" = [ "nixfmt" ];
            };
            format_on_save = {
              lsp_fallback = true;
              timeout_ms = 500;
            };
          };
        };
        extraPackages = [ pkgs.nixfmt ];
      };
    };
}
