{ lib, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      # Only required until nixpkgs updates Kara version to at least revision 64a843c
      packages.kara = pkgs.stdenv.mkDerivation {
        pname = "kara";
        version = "64a843c";

        src = pkgs.fetchFromGitHub {
          owner = "dhruv8sh";
          repo = "kara";
          rev = "64a843c";
          hash = "sha256-UZ3D4FtDuF4wT2EmnbioyHu19wVNYl0mQNZly5b4Mik=";
        };

        nativeBuildInputs = with pkgs; [
          cmake
          kdePackages.extra-cmake-modules
        ];

        buildInputs = with pkgs.kdePackages; [
          qtbase
          qtdeclarative
          ki18n
          kservice
          kwindowsystem
          libplasma
          plasma-activities
          kwin
          plasma-workspace
        ];

        strictDeps = true;

        cmakeFlags = [
          (lib.cmakeFeature "Qt6_DIR" "${pkgs.kdePackages.qtbase}/lib/cmake/Qt6")
        ];

        dontWrapQtApps = true;

        passthru.updateScript = pkgs.nix-update-script { };

        meta = {
          description = "KDE Plasma Applet for use as a desktop/workspace pager";
          homepage = "https://github.com/dhruv8sh/kara";
          license = lib.licenses.gpl3Plus;
          maintainers = with lib.maintainers; [ HeitorAugustoLN ];
          inherit (pkgs.kdePackages.kwindowsystem.meta) platforms;
        };
      };
    };
}
