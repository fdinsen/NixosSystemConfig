{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells.scala = pkgs.mkShell {
      packages = [
        pkgs.scala_3
        pkgs.sbt
        pkgs.coursier
        pkgs.metals   # language server
      ];
    };
  };
}
