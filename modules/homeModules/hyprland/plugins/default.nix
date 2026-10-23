{ self, ... }:
{
  flake.hyprlandHome.plugins = { ... }: {
    imports = with self.hyprlandHome.plugins; [
      hyprglass
    ];
  };
}
