{ ... }:
{
  # Git hunk
  flake.nixvimPlugins.git.hunk = { ... }: {
    programs.nixvim = {
      plugins.hunk = {
        enable = true;
        settings = {
          keys = {
            global = {
              quit = [ "q" ];
              accept = [ "<leader><CR>" ];
            };
            tree = {
              expand_node = [
                "l"
                "<Right>"
              ];
              collapse_node = [
                "h"
                "<Left"
              ];
              open_file = [ "<CR>" ];
              toggle_file = [ "a" ];
            };
            diff = {
              toggle_hunk = [ "A" ];
              toggle_line = [ "a" ];
              toggle_line_pair = [ "s" ];
              prev_hunk = [ "<S-h>" ];
              next_hunk = [ "<C-H>" ];
              toggle_focus = [ "<Tab>" ];
            };
          };
          ui = {
            layout = "horizontal";
            tree = {
              mode = "flat";
              width = 40;
              use_float = true;
              float = {
                border = [
                  "rounded"
                  "shadow"
                ];
                close = [ "<Esc>" ];
              };
            };
          };
          icons = {
            enable_file_icons = true;
            selected = "󰡖";
            deselected = "";
            partially_selected = "󰛲";

            folder_open = "";
            folder_closed = "";

            expanded = "";
            collapsed = "";
          };
        };
      };
    };
  };
}
