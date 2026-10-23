{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells.c = pkgs.mkShell {
      packages = [
        pkgs.gcc
        pkgs.gnumake
        pkgs.cmake
        pkgs.gdb
        pkgs.valgrind
        pkgs.pkg-config
        pkgs.clang-tools   # clangd, clang-format, clang-tidy
      ];
    };
  };
}
