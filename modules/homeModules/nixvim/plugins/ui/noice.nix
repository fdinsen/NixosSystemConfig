{ ... }:
{

  # Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
  # https://nix-community.github.io/nixvim/plugins/noice/index.html
  flake.nixvimPlugins.ui.noice =
    { ... }:
    {
      programs.nixvim = {
        plugins.noice = {
          enable = true;
          settings = {
          };
        };
      };
    };
}
