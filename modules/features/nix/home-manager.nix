{ self, inputs, ... }:
let
  inherit (inputs) plasma-manager nixvim home-manager;
in
{
  imports = [
    home-manager.flakeModules.home-manager
  ];

  nixos.nix.home-manager =
    {
      pkgs,
      username,
      hostname,
      ...
    }:
    {
      imports = [ home-manager.nixosModules.home-manager ];
      environment.systemPackages = [
        pkgs.home-manager
      ];
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs username hostname; };
        backupFileExtension = "hm-bak";
      };
    };
}
