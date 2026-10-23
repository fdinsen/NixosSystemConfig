{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells.idris2 = pkgs.mkShell {
      packages = [
        pkgs.idris2
        pkgs.idris2Packages.idris2Lsp  # language server
        pkgs.idris2Packages.pack # Package manager
      ];
    };
  };
}
