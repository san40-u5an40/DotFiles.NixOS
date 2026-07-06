{ pkgs, profileInfo, ... }:
{
  home.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk_10}";
    DOTNET_CLI_TELEMETRY_OPTUOT = "1";
    DOTNET_SKIP_FIRST_TIME_EXPERIENCE = "1";
    NUGET_PACKAGES = "${profileInfo.homePath}/.nuget/packages";
  };
  home.sessionPath = [
    "${pkgs.dotnet-sdk_10}/bin"
  ];
  home.packages = with pkgs; [
    dotnet-sdk_10
    dotnet-runtime_10
  ];
}
