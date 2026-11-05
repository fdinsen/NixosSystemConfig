{
  self,
  config,
  inputs,
  ...
}:
let
  inherit (inputs) nixpkgs;
  hostname = "fdinsen-vm";
  username = "fdinsen-vm";
in
{
  flake.nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = { inherit inputs hostname username; };
    modules = [
      self.nixosModules."${hostname}-config"
    ]
    ++ (with config.nixos; [
      nix.default
      hyprland.base
      system.default
      networking.default
    ]);

  };

}
