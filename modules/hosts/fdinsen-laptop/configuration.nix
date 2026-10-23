{ ... }:
{
  flake.nixosModules.fdinsen-laptop-config =
    { config, pkgs, ... }:

    {
      imports = [
        # Include the results of the hardware scan.
        ./_hardware-configuration.nix
      ];

      boot.initrd.luks.devices."luks-3dfcc475-c659-4a1a-afef-5091bd4781f7".device =
        "/dev/disk/by-uuid/3dfcc475-c659-4a1a-afef-5091bd4781f7";
      boot.kernelPackages = pkgs.linuxPackages_latest;
      networking.hostName = "fdinsen-laptop"; # Define your hostname.
      # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

      environment.systemPackages = with pkgs; [
        # UTILITIES
        element-desktop
        vlc
        obsidian
        prismlauncher # minecraft launcher
      ];

      # Define a user account. Don't forget to set a password with ‘passwd’.
      users.users."fdinsen" = {
        isNormalUser = true;
        description = "fdinsen";
        extraGroups = [
          "networkmanager"
          "wheel"
          "docker"
        ];
        shell = pkgs.zsh;
      };

      # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
      system.stateVersion = "26.05"; # Did you read the comment?

    };
}
