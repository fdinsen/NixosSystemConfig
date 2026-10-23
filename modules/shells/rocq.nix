{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells.rocq = pkgs.mkShell {
      packages = [
        pkgs.rocqPackages.rocq-core
        pkgs.rocqPackages.rocqide   # optional GUI
        pkgs.rocqPackages.stdlib
        pkgs.rocqPackages.stdpp
      ];
      ROCQLIB = "${pkgs.rocq-core}/lib/coq";
      ROCQPATH = "${pkgs.rocq-core}/lib/coq/user-contrib";
    };
  };
}
