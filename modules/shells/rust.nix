{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells.rust = pkgs.mkShell {
      packages = [
        pkgs.rustc
        pkgs.cargo
        pkgs.rust-analyzer
        pkgs.clippy
        pkgs.rustfmt
      ];
      # so cargo can find std sources for rust-analyzer
      RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
    };
  };
}
