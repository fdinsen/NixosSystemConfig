{
  self,
  inputs,
  config,
  ...
}:
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
      {
        home-manager.users.${username} = self.homeModules."${hostname}-home";
      }
    ]
    ++ (with config.nixos; [
      nix.default
      system.default
      networking.default

      plasma.base
      virtualisation.default
      dev.default
      hardware.fingerprintLogin
    ]);
  };

}
