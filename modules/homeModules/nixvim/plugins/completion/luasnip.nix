{ ... }:
{
  # Snippet Engine
  flake.nixvimPlugins.completion.luasnip =
    { ... }:
    {
      programs.nixvim = {
        plugins.luasnip = {
          enable = true;
        };
        keymaps = [
          {
            mode = "i";
            key = "<C-K>";
            action = "function() ls.expand() end";
            options.silent = true;
          }
          {
            mode = [
              "i"
              "s"
            ];
            key = "<C-L>";
            action = "function() ls.jump( 1) end";
            options.silent = true;
          }
          {
            mode = [
              "i"
              "s"
            ];
            key = "<C-J>";
            action = "function() ls.jump(-1) end";
            options.silent = true;
          }
          {
            mode = [
              "i"
              "s"
            ];
            key = "<C-E>";
            action = "function() if ls.choice_active() then
                                                                    ls.change_choice(1)
                                                                end end";
            options.silent = true;
          }
        ];
      };
    };
}
