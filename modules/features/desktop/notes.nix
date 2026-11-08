{
  nixos.desktop.notes = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      obsidian
    ];
  };

  home.desktop.notes = {
    plasma-workspace.pinnedApps = [
      {
        name = "md.obsidian.Obsidian";
        priority = 40;
      }
    ];
  };
}
