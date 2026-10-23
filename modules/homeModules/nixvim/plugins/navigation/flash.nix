{ ... }:
{
  # Navigate your code with search labels, enhanced character motions and Treesitter integration
  # https://nix-community.github.io/nixvim/plugins/flash/index.html
  flake.nixvimPlugins.navigation.flash =
    { ... }:
    {
      programs.nixvim = {
        plugins.flash = {
          enable = true;
          settings = {
            search = {
              mode = "fuzzy";
            };
          };
        };
      };
    };
}
