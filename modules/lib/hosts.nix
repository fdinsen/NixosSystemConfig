{ lib, inputs, ... }:
{
  options.lib.hosts = lib.mkOption {
    type = lib.types.lazyAttrsOf (lib.types.functionTo lib.types.raw);
    default = { };
  };

  config.lib.hosts = {
    mkNixosHost =
      {
        modules,
        username,
        home,
      }:
      inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = modules ++ [ { home-manager.users.${username} = home; } ];
      };
  };
}
