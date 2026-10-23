{ lib, ... }:
let
  version = "1.5";
in
{
  perSystem = { pkgs, ... }: {
    packages.kwin-geometry-change = pkgs.stdenvNoCC.mkDerivation {
      pname = "kwin-geometry-change";
      inherit version;
      src = pkgs.fetchFromGitHub {
        owner = "peterfajdiga";
        repo = "kwin4_effect_geometry_change";
        rev = "v${version}";
        hash = "sha256-p4FpqagR8Dxi+r9A8W5rGM5ybaBXP0gRKAuzigZ1lyA=";
      };

      dontBuild = true;
      installPhase = ''
        runHook preInstall
        dest=$out/share/kwin/effects/kwin4_effect_geometry_change
        mkdir -p $dest
        cp -r package/* $dest/
        runHook postInstall
      '';

      meta = {
        description = "KWin animation for windows moved or resized by programs or scripts";
        homepage = "https://github.com/peterfajdiga/kwin4_effect_geometry_change";
        license = pkgs.lib.licenses.gpl3Only;
        platforms = pkgs.lib.platforms.linux;
      };
    };
  };
}
