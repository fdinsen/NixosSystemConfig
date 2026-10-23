{ ... }:
{

  # Extensible UI for Neovim notifications and LSP progress messages.
  # https://nix-community.github.io/nixvim/plugins/fidget/index.html
  flake.nixvimPlugins.lsp.fidget =
    { ... }:
    {
      programs.nixvim = {
        plugins.fidget = {
          enable = true;
          settings = {
          };
        };
      };
    };
}
