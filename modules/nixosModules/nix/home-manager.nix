{ self, inputs, ... }:
let
  inherit (inputs) plasma-manager nixvim home-manager;
in
{
  imports = [
    home-manager.flakeModules.home-manager
  ];

  flake.nixosModules.home-manager = { username, hostname, ... }: {
    imports = [ home-manager.nixosModules.home-manager ];
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs username hostname; };
      backupFileExtension = "hm-bak";

      sharedModules = [
        plasma-manager.homeModules.plasma-manager
        nixvim.homeModules.nixvim
        self.homeModules.common
      ];
    };
  };
}
