{
  self,
  inputs,
  config,
  ...
}:
let
  inherit (inputs) nixpkgs;
  hostname = "fdinsen-desktop";
  username = "fdinsen";
in
{
  flake.nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = { inherit inputs hostname username; };
    modules =
      (with self; [
        nixosModules.common
        nixosModules."${hostname}-config"
        nixosModules.home-manager
        {
          home-manager.users.${username} = self.homeModules."${hostname}-home";
        }
      ])
      ++ (with config.nixos; [
        nix.default
        system.default
        networking.default

        plasma.base

        gaming.ffxiv
        gaming.minecraft
        gaming.base

        hardware.fdinsen-desktop

        dev.default
      ]);
  };

}
