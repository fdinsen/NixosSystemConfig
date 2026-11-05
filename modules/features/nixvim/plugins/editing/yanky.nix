{ ... }:
{

  # Improved Yank and Put functionalities for Neovim.
  # https://nix-community.github.io/nixvim/plugins/yanky/index.html
  flake.nixvimPlugins.editing.yanky =
    { ... }:
    {
      programs.nixvim = {
        plugins.yanky = {
          enable = true;
          settings = {
          };
        };
      };
    };
}
