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
    modules = with self.nixosModules; [
      common
      "${hostname}-config"
      plasma
      home-manager
      nvidia-drivers
      logitech-mouse
      disable-mouse-wake

      git

      gaming
      minecraft
      ffxiv
    ];
  };

}
