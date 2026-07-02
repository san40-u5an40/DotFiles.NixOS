{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.mysql-workbench
  ];
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };
}
