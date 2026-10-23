{ ... }:
{
  flake.nixosModules.git = { ... }: {
    programs.git = {
      enable = true;
      config = {
        user = {
          name = "fdinsen";
          email = "mail@fdinsen.com";
        };
      };
    };
  };
}
