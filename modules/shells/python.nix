{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells.python = pkgs.mkShell {
      packages = [
        (pkgs.python314.withPackages (ps: [
          ps.numpy
          ps.requests
          ps.mypy
        ]))
        pkgs.uv
        pkgs.ruff
      ];
    };
  };
}
