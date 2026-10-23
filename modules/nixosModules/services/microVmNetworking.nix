{ ... }:
{
  flake.nixosModules.microVmNetworking =
    { ... }:
    {
      networking.networkmanager.unmanaged = [
        "interface-name:vm-*"
      ];
      systemd.network = {
        enable = true;
        wait-online.enable = false;
        networks."10-lan" = {
          matchConfig.Name = [
            "vm-*"
          ];
          networkConfig.Bridge = "br0";
        };
        netdevs."br0".netdevConfig = {
          Name = "br0";
          Kind = "bridge";
        };
        networks."10-lan-bridge" = {
          matchConfig.Name = "br0";
          networkConfig.Address = [
            "192.168.1.2/24"
          ];
          linkConfig.RequiredForOnline = "routable";
        };
      };
    };
}
