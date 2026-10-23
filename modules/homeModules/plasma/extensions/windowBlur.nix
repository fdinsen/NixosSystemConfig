{ inputs, ... }:
let
  toTransluscent = [
    "md.obsidian.Obsidian"
    "element"
    "dolphin"
    "systemsettings"
    "plasmashell"
  ];
  toBlur = toTransluscent ++ [
    "kitty"
    "rofi"
  ];
in
{
  flake.plasmaHome.extensions.windowBlur = { pkgs, ... }: {
    home.packages = [
      inputs.kwin-effects-glass.packages.${pkgs.system}.default
    ];
    programs.plasma = {
      configFile.kwinrc = {
        "Plugins" = {
          glassEnabled = true;
          blurEnabled = false;
        };
        "Effect-blurplus" = {
          BlurDecorations = true;
          BottomCornerRadius = 15;
          TopCornerRadius = 15;
          PhysicallyBasedRefraction = true;
          RefractionStrength = true;
          BlurMatching = true;
          BlurNonMatching = false;
          WindowClasses = builtins.concatStringsSep "\n" toBlur;
        };
      };
      window-rules =
        toTransluscent
        |> map (title: {
          description = "A Blur Config for ${title}";
          match = {
            window-class.type = "substring";
            window-class.value = title;
          };
          apply = {
            opacityactive = {
              value = 95;
              apply = "force";
            };
            opacityinactive = {
              value = 95;
              apply = "force";
            };
          };
        });
    };
  };
}
