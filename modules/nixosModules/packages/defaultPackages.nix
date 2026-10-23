{ self, ... }:
{
  flake.nixosModules.defaultPackages =
    { pkgs, ... }:
    let
      zen-browser = self.packages.${pkgs.stdenv.hostPlatform.system}.zen-browser-wrapped;
    in
    {
      programs.firefox.enable = true;
      programs.zsh.enable = true;

      environment.systemPackages =
        (with pkgs; [
          # Necessities
          home-manager
          neovim
          fzf # fuzzy finder
          wget
          fd
          ripgrep # rusty grep

          # Development
          neovim
          kitty
        ])
        ++ [
          zen-browser
        ];
    };
}
