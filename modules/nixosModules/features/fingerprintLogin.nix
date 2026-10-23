{ ... }:
{
  flake.nixosModules.fingerprintLogin =
    { ... }:
    {
      services.fprintd.enable = true;
      security.pam.services = {
        sddm.fprintAuth = true;
        sudo.fprintAuth = true;

        # This must be false due to existing issue:
        # https://github.com/NixOS/nixpkgs/issues/239770
        kde.fprintAuth = false;
        login.fprintAuth = false;
      };
    };
}
