{ ... }:
{
  perSystem = { pkgs, ... }: {
    packages.windowTitleApplet = pkgs.stdenvNoCC.mkDerivation {
      pname = "Window Title Applet";
      version = "1.0.1";

      src = pkgs.fetchFromGitHub {
        owner = "dhruv8sh";
        repo = "plasma6-window-title-applet";
        rev = "9dd66da8c22f7d77e4ce3608f45c34ed81035b48"; # <- From merge request to fix issue
        hash = "sha256-jdoa2dz+7VgwQsbfjqOSfZfV3KOwHC+lSLzg3e1vSSs=";
      };
      dontBuild = true;

      installPhase = ''
        runHook preInstall
        mkdir -p $out/share/plasma/plasmoids/org.kde.windowtitle
        cp -r ./* $out/share/plasma/plasmoids/org.kde.windowtitle
        runHook postInstall
      '';
    };
  };
}
