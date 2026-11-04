# configuration file for all the settings that are common to all setups
{
  self,
  config,
  inputs,
  ...
}:

{
  flake.nixosModules.common = { pkgs, ... }: {
    imports =
      (with self.modules.nixos; [
        kara
      ])
      ++ (with self.nixosModules; [
        defaultPackages
      ]);
  };
}
