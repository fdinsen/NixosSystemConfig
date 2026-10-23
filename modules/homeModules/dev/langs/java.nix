{ ... }:
{
  flake.homeModules.java =
    { pkgs, ... }:
    {
      programs.java = {
        enable = true;
        package = pkgs.javaPackages.compiler.temurin-bin.jdk-25;
      };
    };
}
