{ pkgs, profileInfo, ... }:
{
  imports =
    [
      ./programs-modules
      ./system-modules
      ./hardware-configuration.nix
    ];

  environment.systemPackages = [ pkgs.home-manager ];
  system.stateVersion = profileInfo.stateVersion;
}
