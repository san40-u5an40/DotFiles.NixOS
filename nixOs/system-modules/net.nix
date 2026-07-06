{ profileInfo, ... }:
{
  networking = {
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "8.8.8.8"
      "8.8.4.4"
    ];
    hostName = profileInfo.hostName;
    networkmanager = {
      enable = true;
      dns = "none";
    };
    firewall = {
      allowedTCPPorts = [ 22000 ];
      allowedUDPPorts = [ 22000 21027 ];
    };
  };
}
