{ ... }:
{
  # A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.
  # https://nix-community.github.io/nixvim/plugins/trouble/index.html
  flake.nixvimPlugins.lsp.trouble =
    { ... }:
    {
      programs.nixvim = {
        plugins.trouble = {
          enable = true;
          settings = {
          };
        };
      };
    };
}
