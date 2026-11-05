{ ... }:
{
  nixos.hosts.fdinsen-laptop =
    { pkgs, ... }:
    {
      imports = [
        # Include the results of the hardware scan.
        ./_hardware-configuration.nix
      ];

      boot.initrd.luks.devices."luks-3dfcc475-c659-4a1a-afef-5091bd4781f7".device =
        "/dev/disk/by-uuid/3dfcc475-c659-4a1a-afef-5091bd4781f7";
      networking.hostName = "fdinsen-laptop"; # Define your hostname.

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
