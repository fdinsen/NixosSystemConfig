{ ... }:
{
  nixos.boot.windows-dualboot = {
    boot.loader.systemd-boot.extraEntries = {
      "windows.conf" = ''
        title Windows
        efi /EFI/Microsoft/Boot/bootmgfw.efi
      '';
    };
  };
}
