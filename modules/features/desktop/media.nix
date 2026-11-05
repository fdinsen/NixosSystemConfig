{
  nixos.desktop.media = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      vlc
    ];
  };
}
