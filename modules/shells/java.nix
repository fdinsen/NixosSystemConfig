{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells.java = pkgs.mkShell {
      packages = [
        pkgs.jdk21
        pkgs.maven
        pkgs.gradle
        pkgs.jdt-language-server   # LSP, aka eclipse.jdt.ls
      ];
    };
  };
}
