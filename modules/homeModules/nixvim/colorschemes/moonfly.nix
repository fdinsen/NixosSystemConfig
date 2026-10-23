{ ... }:
{
  flake.homeModules."nixvim.colorschemes.moonfly" = 
    { ... }:
    let 
      separator = sep: 
        if sep == "none" then 0 else
        if sep == "block" then 1 else
        if sep == "line" then 2 else 0;
    in
    {
      programs.nixvim = {
        colorschemes.moonfly = {
          enable = true;
          settings = {
            CursorColor = true;
            Italics = true;
            NormalPmenu = true;
            NormalFloat = true;
            TerminalColors = true;
            Transparent = true;
            Undercurls = true;
            UnderlineMatchParen = true;
            VirtualTextColor = true;
            WinSeparator = separator "line";
          };
        };
        opts = {
          fillchars = "horiz:━,horizup:┻,horizdown:┳,vert:┃,vertleft:┫,vertright:┣,verthoriz:╋";
          pumborder = "single";
          winborder = "single";
        };

      };
    };
}
