{ inputs, lib, ... }:
{
  options.nixos.overlays.kara = lib.mkOption {
    type = lib.types.deferredModule;
  };
  config = {
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
    nixos.overlays.kara = {
      nixpkgs.overlays = [ inputs.self.overlays.kara ];
    };

    perSystem = { system, ... }: {
      packages.kara =
        (import inputs.nixpkgs {
          inherit system;
          overlays = [ inputs.self.overlays.kara ];
        }).kara;
    };
  };
}
