{ ... }:
{
  flake.nixosModules.openbao = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.openbao
      ];
      services.openbao = {
        enable = true;
        settings = {
          ui = true;
          listener.default = {
            type = "tcp";
            address = "https://127.0.0.1:8200";
            # tls_cert_file
          };
        };
      };
    };
}
