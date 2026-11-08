{ ... }:
{
  nixos.gaming.base = { pkgs, ... }: {
    programs.steam.enable = true;
    programs.steam.gamescopeSession.enable = true;
    programs.gamemode.enable = true;

    environment.systemPackages = with pkgs; [
      protonup-qt
      discord
    ];
  };

  home.gaming.base = {
    plasma-workspace.pinnedApps = [
      {
        name = "steam";
        priority = 50;
      }
    ];
  };
}
