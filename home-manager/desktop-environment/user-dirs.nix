{ profileInfo, ... }:
let
  homePath = profileInfo.homePath;
  externalDiskPath = profileInfo.externalDiskPath;
  myAppsPath = "${homePath}/MyApplications";
in
{
  home.sessionPath = [
    myAppsPath
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
      download = "${externalDiskPath}/1_downloads";

      extraConfig = {
        XDG_BACK_UP_DIR = "${homePath}/.BackUp";
        XDG_MY_APPLICATION_DIR = myAppsPath;
        XDG_EXTERNAL_DISK_DIR = externalDiskPath;
      };
    };
  };
}
