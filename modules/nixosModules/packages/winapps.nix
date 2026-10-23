{ inputs, ... }:
{
  flake.nixosModules.winapps = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.freerdp
      pkgs.dialog
      pkgs.iproute2
      pkgs.libnotify
      pkgs.netcat
      inputs.winapps
    ];
  };
}
