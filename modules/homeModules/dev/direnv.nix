{ lib, ... }:
{
  flake.homeModules.direnv =
    { pkgs, config, ... }:
    let
      shellTypes = lib.types.enum [ "bash" "fish" "zsh" "nushell" ];
      enableShellIntegrations = shells: with lib.lists; {
        enableBashIntegration    = (elem "bash"    shells);
        enableFishIntegration    = (elem "fish"    shells);
        enableZshIntegration     = (elem "zsh"     shells);
        enableNushellIntegration = (elem "nushell" shells);
      };
      cfg = config.custom.direnv;
    in
    {
      options.custom.direnv = {
        enabledShellIntegrations = lib.mkOption {
          type = lib.types.listOf shellTypes;
          default = [ "bash" ];
          description = "The shells to enable direnv in";
        };
      };
      config = {
        programs.direnv = {
          enable = true;
          nix-direnv.enable = true;
        } // enableShellIntegrations cfg.enabledShellIntegrations;
      };
    };
}
