{ lib, ... }:
{
  flake.nixvimLangs.nix-nixd =
    { config, hostname, ... }:
    let
      cfg = config.custom.nixvimLangs.nix-nixd;

      nixpkgs-expr = ''
        let
          flake = builtins.getFlake (toString ./.);
        in
        if flake ? inputs && flake.inputs ? nixpkgs
        then import flake.inputs.nixpkgs { }
        else import <nixpkgs> { }
      '';

      nixos-expr = ''
        let
            flake = builtins.getFlake (toString ./.);
            cfgs = flake.nixosConfigurations or { };
        in
          if cfgs != { }
          then (builtins.head (builtins.attrValues cfgs)).options
          else { }
      '';

      flake-parts-expr = ''
        (builtins.getFlake (toString ./.)).debug.options or { }
      '';

      flake-parts-persystem-expr = ''
        (builtins.getFlake (toString ./.)).currentSystem.options or { }
      '';
    in
    {
      options.custom.nixvimLangs.nix-nixd = {
        enable = lib.mkEnableOption "nixvimLangs.nix-nixd";
      };
      config = lib.mkIf cfg.enable {
        programs.nixvim = {
          lsp.servers.nixd = {
            enable = true;
            config.settings.nixd = {
              nixpkgs.expr = nixpkgs-expr;
              formatting.command = [ "nixfmt" ];
              options = {
                nixos.expr = nixos-expr;
                # home-manager.expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.${hostname}.options.home-manager.users.type.getSubOptions []";
                flake-parts.expr = flake-parts-expr;
                flake-parts-persystem.expr = flake-parts-persystem-expr;
              };
            };
          };

        };
      };
    };
}
