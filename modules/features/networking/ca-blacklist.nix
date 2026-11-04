{ ... }:
{
  nixos.networking.ca-blacklist = {
    security.pki.caCertificateBlacklist = [
      "Comodo AAA Services root"
    ];
  };
}
