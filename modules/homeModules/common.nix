{ self, inputs, ... }:
{
  flake.homeModules.common =
    {
      lib,
      pkgs,
      config,
      ...
    }:
    {
      imports = [
        self.homeModules.nixvim
        self.homeModules.kitty
        self.homeModules.zsh
        self.homeModules.rofi
      ];

      fonts.fontconfig.enable = true;
      home = {
        packages = with pkgs; [
          # Note: Nerd-fonts must apparently be user-space, for Nvim to use them
          nerd-fonts.fira-code
          nerd-fonts.droid-sans-mono
        ];

        stateVersion = "25.11";

        sessionVariables = {
          EDITOR = "nvim";
          VISUAL = "nvim";
        };
      };

      xdg.configFile."mimeapps.list".force = true;
      xdg = {
        enable = true;
        mimeApps = {
          enable = true;
          defaultApplications = {
            # Web
            "text/html" = "zen.desktop";
            "x-scheme-handler/http" = "zen.desktop";
            "x-scheme-handler/https" = "zen.desktop";

            # Terminal
            "x-scheme-handler/terminal" = "kitty.desktop";
          };
        };
      };
    };
}
