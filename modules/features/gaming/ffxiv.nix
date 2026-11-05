{ config, ... }: {
  nixos.gaming.ffxiv = { pkgs, ... }: {
    imports = [
      config.nixos.gaming.base
    ];
    environment.systemPackages = with pkgs; [
      xivlauncher
    ];
  };
}
