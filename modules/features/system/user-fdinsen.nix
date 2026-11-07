{
  nixos.system.user-fdinsen = { pkgs, ... }: {
    users.users.fdinsen = {
      isNormalUser = true;
      description = "Fdinsen";
      extraGroups = [
        "networkmanager"
        "wheel"
        "input"
        "docker"
      ];
      packages = [ ];
      shell = pkgs.zsh;
    };
  };
}
