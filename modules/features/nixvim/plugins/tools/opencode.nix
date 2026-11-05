{ ... }:
{
  flake.nixvimPlugins.tools.opencode =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.opencode
        pkgs.opencode-claude-auth
      ];
      programs.nixvim = {
        plugins.opencode = {
          enable = true;
        };
        plugins.snacks = {
          enable = true;
          settings.input.enabled = true;
        };
      };
    };
}
