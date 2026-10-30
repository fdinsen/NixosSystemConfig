{ inputs, ... }:
{
  flake.overlays.kara = final: prev: {
    kara = prev.kara.overrideAttrs (old: {
      version = "64a843c";
      src = final.fetchFromGitHub {
        owner = "dhruv8sh";
        repo = "kara";
        rev = "64a843c";
        hash = "sha256-UZ3D4FtDuF4wT2EmnbioyHu19wVNYl0mQNZly5b4Mik=";
      };
    });
  };
  flake.modules.nixos.kara = {
    nixpkgs.overlays = [ inputs.self.overlays.kara ];
  };
  perSystem = { system, ... }: {
    packages.kara =
      (import inputs.nixpkgs {
        inherit system;
        overlays = [ inputs.self.overlays.kara ];
      }).kara;
  };
}
