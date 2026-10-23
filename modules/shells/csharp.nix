{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells.csharp = pkgs.mkShell {
      packages = [
        pkgs.dotnet-sdk_8
        pkgs.omnisharp-roslyn   # LSP
      ];

      # dotnet wants to write telemetry/nuget caches; keep it inside the project
      # and stop it phoning home on every shell entry
      DOTNET_CLI_TELEMETRY_OPTOUT = "1";
      DOTNET_NOLOGO = "1";
    };
  };
}
