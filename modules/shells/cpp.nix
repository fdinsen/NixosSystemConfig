{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells.cpp = pkgs.mkShell {
      packages = [
        pkgs.gcc            # or pkgs.clang if you prefer LLVM as the primary compiler
        pkgs.cmake
        pkgs.ninja
        pkgs.gnumake
        pkgs.gdb
        pkgs.valgrind
        pkgs.pkg-config
        pkgs.clang-tools    # clangd, clang-format, clang-tidy — works fine alongside gcc
        pkgs.boost          # common enough to include by default; drop if unused
      ];
    };
  };
}
