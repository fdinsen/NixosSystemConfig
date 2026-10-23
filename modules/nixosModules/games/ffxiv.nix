{ self, ... }: {
  flake.nixosModules.ffxiv = { pkgs, ... }: {
    imports = [
      self.nixosModules.gaming
    ];
    environment.systemPackages = with pkgs; [
      xivlauncher
    ];
  };
}
