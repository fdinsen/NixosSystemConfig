{ inputs, ... }:
{
  perSystem = { pkgs, system, ... }: {
    packages.zen-browser-wrapped = pkgs.symlinkJoin {
      name = "zen-browser-wrapped";
      paths = [ inputs.zen-browser.packages.${system}.default ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/zen \
          --prefix LD_LIBRARY_PATH : ${pkgs.ffmpeg.lib}/lib
      '';
    };
  };
}
