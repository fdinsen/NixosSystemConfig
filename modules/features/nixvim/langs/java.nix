{ lib, ... }:
{
  home.nixvim.langs.java = {
    programs.nixvim = {
      plugins.jdtls = {
        enable = true;
        settings = {
          java = {
            signatureHelp.enabled = true;
          };
        };
      };
    };
  };
}
