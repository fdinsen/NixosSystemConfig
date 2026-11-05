{ ... }:
{
  nixos.hosts.fdinsen-desktop = { pkgs, ... }: {
    imports = [
      ./_hardware-configuration.nix
    ];

    custom = {
      plasma = {
        loginAlign = "left";
        loginWallpaper = "shadedLandscape";
      };
    };

    networking.hostName = "fdinsen-desktop"; # Define your hostname.

    users.users.fdinsen = {
      isNormalUser = true;
      description = "Fdinsen";
      extraGroups = [
        "networkmanager"
        "wheel"
        "input"
        "docker"
      ];
      packages = [ ];
      shell = pkgs.zsh;
    };

    # File system setup for other drives
    fileSystems."/mnt/ssd256" = {
      device = "/dev/disk/by-label/ssd256";
      fsType = "ext4";
    };

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.11"; # Did you read the comment?

  };
}
