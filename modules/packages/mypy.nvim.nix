{ ... }: 
{
  perSystem = { pkgs, ... }: {
    packages."mypy.nvim" = pkgs.vimUtils.buildVimPlugin {
      name = "mypy.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "feakuru";
        repo = "mypy.nvim";
        rev = "7c21900112782559d82ed17f11e43d75e871d079";
        sha256 = "sha256-xMXY/4pb+MgdOh+XTtJSqLyCHLHjZWhVUoxY0vOQebA=";
      };
    };
  };
}
