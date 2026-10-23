{ ... }:
{
  flake.nixosModules.fdinsen-desktop-config = { pkgs, ... }: {
    imports = [
      ./_hardware-configuration.nix
    ];

    custom = {
      plasma = {
        loginAlign = "left";
        loginWallpaper = "shadedLandscape";
      };
    };

    boot.loader.systemd-boot.extraEntries = {
      "windows.conf" = ''
        title Windows
        efi /EFI/Microsoft/Boot/bootmgfw.efi
      '';
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

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
      # UTILITIES
      element-desktop
      vlc
      obsidian
      slack
    ];

    environment.variables.QT_QPA_PLATFORMTHEME = "kde";

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
