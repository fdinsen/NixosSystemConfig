{ self, ... }:
{
  flake.plasmaHome.extensions.geometryChange =
    { pkgs, ... }:
    let
      system = pkgs.stdenv.hostPlatform.system;
      kwin-geometry-change = self.packages.${system}.kwin-geometry-change;
    in
    {
      home.file.".local/share/kwin/effects/kwin4_effect_geometry_change".source =
        "${kwin-geometry-change}/share/kwin/effects/kwin4_effect_geometry_change";

      # plasma-manager: enable the plugin in kwinrc
      programs.plasma.configFile."kwinrc"."Plugins".kwin4_effect_geometry_changeEnabled = true;
    };
}
