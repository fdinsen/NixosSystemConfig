{ ... }: 
{
  perSystem = { pkgs, ... }: {
    packages.coqtail = pkgs.vimUtils.buildVimPlugin {
      name = "coqtail";
      src = pkgs.fetchFromGitHub {
        owner = "whonore";
        repo = "Coqtail";
        rev = "a25018e4f371016aefea267038ac5d083b615da9";
        sha256 = "sha256-Oe98hkLZpAqYqfVVrv5v+VpCFWcvfBvYYwhZOLlD2ko=";
      };
    };
  };
}
