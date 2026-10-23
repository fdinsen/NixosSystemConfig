{ self, ... }:
{
  # Tool for previewing markdown
  # Use :MarkdownPreview
  flake.nixvimPlugins.tools.markdown-preview =
    { pkgs, ... }:
    let
      # Source: https://github.com/NixOS/nixpkgs/blob/nixos-26.05/pkgs/applications/editors/vim/plugins/overrides.nix#L2458
      mkdpSrc = pkgs.fetchFromGitHub {
        owner = "UtkarshKunwar";
        repo = "markdown-preview.nvim";
        rev = "master";
        hash = "sha256-/Uafe28hTcHLu6TJ7OKKkn++/1U9FwCGDdaGiovckmc=";
      };

      mkdpNodeModules = pkgs.stdenv.mkDerivation {
        pname = "markdown-preview-nvim-node-modules";
        version = "unstable";
        src = mkdpSrc;
        nativeBuildInputs = [ pkgs.yarnConfigHook ];
        yarnOfflineCache = pkgs.fetchYarnDeps {
          yarnLock = "${mkdpSrc}/yarn.lock";
          hash = "sha256-Dg2t8gdLihO+lDusfZbyaqNcma4ZwCAmsoXYvzwC4ws=";
        };
        installPhase = ''
          cp -r node_modules $out
        '';
      };

      markdownPreviewPackage = pkgs.vimUtils.buildVimPlugin {
        pname = "markdown-preview-nvim";
        version = "unstable-utkarshkunwar";
        src = mkdpSrc;

        postInstall = ''
          cp -r ${mkdpNodeModules} $out/app/node_modules
        '';
        runtimeDeps = [ pkgs.nodejs ];

        nativeBuildInputs = [ pkgs.nodejs ];
        doInstallCheck = true;
        installCheckPhase = ''
          node $out/app/index.js --version
        '';
      };
    in
    {
      programs.nixvim = {
        plugins.markdown-preview = {
          enable = true;
          package = markdownPreviewPackage;
        };
      };
    };
}
