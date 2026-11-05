{ lib, ... }:
{
  # Buffer line (visual tabs)
  flake.nixvimPlugins.ui.barbar =
    { ... }:
    let
      mkGotoKeymaps =
        lower: upper:
        map (n: {
          key = "<A-${toString n}>";
          action = ":BufferGoto${toString n}<CR>";
        }) (lib.range lower upper);
    in
    {
      programs.nixvim = {
        plugins.barbar = {
          enable = true;
          settings = {

          };
        };
        keymaps = [
          {
            key = "<S-l>";
            action = ":BufferNext<CR>";
          }
          {
            key = "<S-h>";
            action = ":BufferPrevious<CR>";
          }
          {
            key = "<S-A-l>";
            action = ":BufferMoveNext<CR>";
          }
          {
            key = "<S-A-h>";
            action = ":BufferMovePrevious<CR>";
          }
          {
            key = "<S-0>";
            action = ":BufferLast<CR>";
          }
          {
            key = "<S-q>";
            action = ":BufferClose<CR>";
          }
          {
            key = "<S-A-q>";
            action = ":BufferRestore<CR>";
          }
        ]
        ++ mkGotoKeymaps 1 9;
        extraConfigLua = ''
          do
            local function transparent(name)
              local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
              if ok then
                hl.bg = nil
                vim.api.nvim_set_hl(0, name, hl)
              end
            end

            for _, group in ipairs({
              "BufferCurrent", "BufferCurrentIndex", "BufferCurrentMod", "BufferCurrentSign",
              "BufferCurrentERROR", "BufferCurrentWARN", "BufferCurrentINFO", "BufferCurrentHINT",
              "BufferVisible", "BufferVisibleIndex", "BufferVisibleMod", "BufferVisibleSign",
              "BufferVisibleERROR", "BufferVisibleWARN", "BufferVisibleINFO", "BufferVisibleHINT",
              "BufferInactive", "BufferInactiveMod", "BufferInactiveSign", "BufferInactiveERROR",
              "BufferInactiveWARN", "BufferInactiveINFO", "BufferInactiveHINT",
              "BufferAlternate", "BufferAlternateIndex", "BufferAlternateMod", "BufferAlternateSign",
              "BufferAlternateERROR", "BufferAlternateWARN", "BufferAlternateINFO", "BufferAlternateHINT",
              "BufferTabpages", "BufferTabpageFill",
              "TabLine", "TabLineFill", "TabLineSel",
              "StatusLine", "StatusLineNC",
            }) do
              transparent(group)
            end
          end
        '';
      };
    };
}
