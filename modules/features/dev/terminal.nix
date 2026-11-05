{ ... }:
{
  nixos.dev.terminal =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        neovim
        fzf # fuzzy finder
        wget
        fd
        ripgrep # rusty grep
      ];
    };
}
