{ ... }:
{
  # Tab bar
  flake.nixvimPlugins.ui.bufferline =
    { ... }:
    {
      programs.nixvim = {
        plugins.bufferline = {
          enable = true;
        };
        keymaps = [
          {
            key = "<S-l>";
            action = ":BufferLineCycleNext<CR>";
          }
          {
            key = "<S-h>";
            action = ":BufferLineCyclePrev<CR>";
          }
        ];
      };
    };
}
