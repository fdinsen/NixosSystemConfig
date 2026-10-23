{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells.haskell = pkgs.mkShell {
      packages = [
        # pkgs.haskell.compiler.ghc
        (pkgs.haskellPackages.ghcWithPackages (hp: [
          # Haskell packages here
          hp.aeson # JSON Library
          hp.ihp # Web framework
        ]))
        pkgs.cabal-install
        pkgs.stack
      ];
    };
  };
}
