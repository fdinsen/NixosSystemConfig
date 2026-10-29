{ ... }:
{
  flake.nixosModules.ca-blacklist = {
    security.pki.caCertificateBlacklist = [
      "Comodo AAA Services root"
    ];
  };
}
