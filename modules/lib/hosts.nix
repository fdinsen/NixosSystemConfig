{
  lib,
  inputs,
  config,
  ...
}:
{
  options.lib.hosts = lib.mkOption {
    type = lib.types.lazyAttrsOf (lib.types.functionTo lib.types.raw);
    default = { };
  };

  config.lib.hosts = {
    mkNixosHost =
      {
        features,
        extraModules ? [ ],
        username,
        hostname,
        stateVersion,
        home,
        hardware-config,
      }:
      let
        paths = map (lib.splitString ".") features;
        show = lib.concatStringsSep ".";

        nixosModules = map (p: lib.attrByPath p (throw "No nixos feature '${show p}'") config.nixos) paths;

        # only features that actually have a home counterpart
        homeModules = map (p: lib.getAttrFromPath p config.home) (
          lib.filter (p: lib.hasAttrByPath p config.home) paths
        );
      in
      inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules =
          nixosModules
          ++ extraModules
          ++ [
            {
              imports = [ hardware-config ];
              networking.hostName = hostname;
              home-manager.users.${username}.imports = [ home ] ++ homeModules;
              system.stateVersion = stateVersion;
            }
          ];
      };
  };
}
