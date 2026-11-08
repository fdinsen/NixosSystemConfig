{
  nixos.desktop.rkp = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      element-desktop
    ];
  };

  home.desktop.rkp = {
    plasma-workspace.pinnedApps = [
      {
        name = "element-desktop";
        priority = 60;
      }
    ];
  };
}
