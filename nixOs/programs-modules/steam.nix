{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.steam-run ];
  programs = {
    gamemode.enable = true;
    steam = {
      enable = true;
      package = pkgs.steam;
      #dedicatedServer.openFirewall = true;
      #localNetworkGameTransfers.openFirewall = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ];
    };
  };
}
