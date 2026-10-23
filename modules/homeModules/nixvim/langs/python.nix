{ self, lib, ... }:
{
  flake.nixvimLangs.python =
    { pkgs, config, ... }:
    let
      cfg = config.custom.nixvimLangs.python;
    in
    {
      options.custom.nixvimLangs.python = {
        enable = lib.mkEnableOption "nixvimLangs.python";
      };
      config = lib.mkIf config.custom.nixvimLangs.python.enable {
        programs.nixvim = {
          lsp.servers.pylsp = {
            enable = true;
          };
          extraPlugins = [
            self.packages.${pkgs.system}."mypy.nvim"
          ];
        };
      };
    };
}
