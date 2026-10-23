{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells.ocaml = pkgs.mkShell {
      packages = [
        pkgs.ocaml
        pkgs.dune_3
        pkgs.ocamlPackages.utop
        pkgs.ocamlPackages.ocaml-lsp
        pkgs.ocamlPackages.odoc
        pkgs.opam
      ];
    };
  };
}
