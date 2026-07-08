{ pkgs, profileInfo, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./programs-modules
      ./system-modules
    ];

  environment.systemPackages = [ pkgs.home-manager ];
  system.stateVersion = profileInfo.stateVersion;
}
