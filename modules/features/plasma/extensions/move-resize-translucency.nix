{
  home.plasma.extensions.move-resize-translucency = {
    programs.plasma.configFile."kwinrc" = {
      "Effect-translucency" = {
        MoveResize = 78;
      };
      "Plugins" = {
        translucencyEnabled = true;
      };
    };
  };
}
