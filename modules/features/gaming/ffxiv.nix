{ config, ... }: {
  nixos.gaming.ffxiv = { pkgs, ... }: {
    imports = [
      config.gaming.base
    ];
    environment.systemPackages = with pkgs; [
      xivlauncher
    ];
  };
}
