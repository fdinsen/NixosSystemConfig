{ lib, ... }:
{
  flake.homeModules.zsh =
    { pkgs, config, ... }:
    {
      programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        historySubstringSearch.enable = true;
        autocd = true;

        shellAliases = {
          update = "nixos-rebuild switch --flake .#$(hostname) --sudo";
        };

        history = {
          append = true;
          extended = true;
        };
        dotDir = "${config.xdg.configHome}/zsh";
        oh-my-zsh = {
          enable = true;
          plugins = [
            "fzf"
            "z"
            "colored-man-pages"
            "colorize"
            "alias-finder"
            "aliases"
          ];
        };
        plugins = [
          {
            name = "vi-mode";
            src = pkgs.zsh-vi-mode;
            file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
          }
          {
            name = "zsh-nix-shell";
            file = "nix-shell.plugin.zsh";
            src = pkgs.fetchFromGitHub {
              owner = "chisui";
              repo = "zsh-nix-shell";
              rev = "82ca15e638cc208e6d8368e34a1625ed75e08f90";
              hash = "sha256-Rtg8kWVLhXRuD2/Ctbtgz9MQCtKZOLpAIdommZhXKdE=";
            };
          }
        ];
      };
      programs.starship = {
        enable = true;
        enableZshIntegration = true;
        presets = [
          # "jetpack"
          "gruvbox-rainbow"
        ];
      };
    };
}
