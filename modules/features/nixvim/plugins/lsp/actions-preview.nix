{
  home.nixvim.plugins.lsp.actions-preview =
    { ... }:
    {
      programs.nixvim.plugins.actions-preview = {
        enable = true;
      };
    };
}
