{
  nixos.desktop.rkp = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      element-desktop
    ];
  };
}
