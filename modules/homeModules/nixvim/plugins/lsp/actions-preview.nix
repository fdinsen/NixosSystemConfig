{
  flake.nixvimPlugins.lsp.actions-preview =
    { ... }:
    {
      programs.nixvim.plugins.actions-preview = {
        enable = true;
      };
    };
}
