{ ... }:
{
  flake.nixosModules.ca-blacklist = {
    security.pki.caCertificateBlacklist = [
      "Comodo AAA Services root"
      "emSign ECC Root CA - G3"
    ];
  };
}
