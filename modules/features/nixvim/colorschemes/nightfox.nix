{ ... }:
{
  home.nixvim.colorschemes.nightfox = {
    programs.nixvim = {
      colorschemes.nightfox = {
        enable = true;
        flavor = "duskfox";
        settings = {
          options = {
            transparent = true;
            terminal_colors = true;
            inverse = {
              match_paren = true;
              visual = true;
              search = true;
            };
          };
        };
      };
    };
  };
}
