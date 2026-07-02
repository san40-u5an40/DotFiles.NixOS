{ config, ... }:
let
  home = config.home.homeDirectory;
in
{
  home.sessionPath = [
    "${home}/MyApllications"
  ];
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;

      desktop = null;
      templates = null;
      videos = null;
      music = null;
      pictures = null;
      documents = null;
      publicShare = null;
      projects = null;
      download = "${home}/Downloads";

      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${home}/Screenshots";
        XDG_MY_APPLICATION_DIR = "${home}/MyApllications";
        XDG_EXTERNAL_DISK_DIR = "${home}/ExternalDisk";
        XDG_BACK_UP_DIR = "${home}/.BackUp";
      };
    };
  };
}
