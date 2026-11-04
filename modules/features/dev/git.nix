{ ... }:
{
  nixos.dev.git = { ... }: {
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
