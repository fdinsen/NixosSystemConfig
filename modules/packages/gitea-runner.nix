# https://github.com/NixOS/nixpkgs/blob/nixos-26.05/pkgs/by-name/gi/gitea-actions-runner/package.nix#L43
{ lib, ... }:
{
  perSystem = { pkgs, ... }: {
    packages.gitea-runner = pkgs.buildGoModule (finalAttrs: {
      pname = "gitea-actions-runner";
      version = "2.3.0";

      src = pkgs.fetchFromGitea {
        domain = "gitea.com";
        owner = "gitea";
        repo = "runner";
        rev = "v${finalAttrs.version}";
        # hash = lib.fakeHash;
        hash = "sha256-j2M/r9PzwRV1sq/adeQe0gRhuepZjS+K46JecMz9QRY=";
      };

      vendorHash = "sha256-Oumo7ztQMkczbTj41syJZ6HRD6mCf2w11hvR7BbGmDc=";

      # Tests require network access (artifactcache tests try to determine outbound IP)
      doCheck = false;

      ldflags = [
        "-s"
        "-w"
        "-X gitea.com/gitea/runner/internal/pkg/ver.version=v${finalAttrs.version}"
      ];

      postInstall = ''
        mv "$out/bin/runner" "$out/bin/gitea-runner"
      '';

      # passthru.tests.version = testers.testVersion {
      #   package = gitea-actions-runner;
      #   version = "v${finalAttrs.version}";
      # };

      meta = {
        changelog = "https://gitea.com/gitea/runner/releases/tag/v${finalAttrs.version}";
        description = "Runner for Gitea based on act";
        homepage = "https://gitea.com/gitea/runner";
        license = lib.licenses.mit;
        mainProgram = "gitea-runner";
        maintainers = with lib.maintainers; [
          superherointj
          techknowlogick
        ];
      };
    });
  };
}
