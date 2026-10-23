{ self, inputs, ... }:
let
  inherit (inputs) nixpkgs;
  hostname = "fdinsen-desktop";
  username = "fdinsen";
in
{
  flake.nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = { inherit inputs hostname username; };
    modules = with self; [
      nixosModules.common
      nixosModules."${hostname}-config"
      nixosModules.home-manager
      {
        home-manager.users.${username} = self.homeModules."${hostname}-home";
      }

      nixosModules.plasma
      nixosModules.nvidia-drivers
      nixosModules.logitech-mouse
      nixosModules.disable-mouse-wake

      nixosModules.git

      nixosModules.gaming
      nixosModules.minecraft
      nixosModules.ffxiv
    ];
  };

}
