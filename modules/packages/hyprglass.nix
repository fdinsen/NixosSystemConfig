{
  lib,
  inputs,
  ...
}:
{
  perSystem = { pkgs, ... }: {
    packages.hyprglass = pkgs.hyprlandPlugins.mkHyprlandPlugin {
      pluginName = "hyprglass";
      version = "0.8.1";
      hyprland = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      src = pkgs.fetchFromGitHub {
        owner = "hyprnux";
        repo = "hyprglass";
        rev = "v0.8.1";
        hash = "sha256-yUU0gKu1CXqpUQBtyb3IWNBYZ1bCAm99mfTUV7ceJyg=";
      };

      installPhase = ''
        runHook preInstall
        mkdir -p $out/lib
        cp hyprglass.so $out/lib/libhyprglass.so
        runHook postInstall
      '';

      meta = {
        homepage = "https://github.com/hyprnux/hyprglass";
        description = "Liquid Glass inspired window/layer decoration plugin for Hyprland";
        license = lib.licenses.bsd3;
        platforms = lib.platforms.linux;
      };
    };
  };
}
