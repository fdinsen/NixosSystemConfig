{ ... }:
{
  flake.homeModules.rust =
    { config, pkgs, ... }:
    {
      home.packages = with pkgs; [
        cargo
        rustc
        rustfmt
        vscode-extensions.vadimcn.vscode-lldb
      ];
    };
}
