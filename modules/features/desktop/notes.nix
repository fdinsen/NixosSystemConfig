{
  nixos.desktop.notes = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      obsidian
    ];
  };
}
