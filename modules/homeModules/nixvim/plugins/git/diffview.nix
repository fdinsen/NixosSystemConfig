{ ... }:
{

  # Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
  # https://nix-community.github.io/nixvim/plugins/diffview/index.html
  flake.nixvimPlugins.git.diffview =
    { ... }:
    {
      programs.nixvim = {
        plugins.diffview = {
          enable = true;
          settings = {
          };
        };
      };
    };
}
