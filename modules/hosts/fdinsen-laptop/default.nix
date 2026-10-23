{ self, inputs, ... }:
let
  inherit (inputs) nixpkgs;
  hostname = "fdinsen-laptop";
  username = "fdinsen";
in
{
  flake.nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = { inherit inputs hostname username; };
    modules = [
      self.nixosModules.common
      self.nixosModules."${hostname}-config"
      self.nixosModules.plasma
      self.nixosModules.home-manager
      self.nixosModules.fingerprintLogin
      self.nixosModules.docker
      self.nixosModules.git
    ];
  };

}
