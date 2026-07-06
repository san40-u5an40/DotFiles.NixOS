{ profileInfo, ... }:
{
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        showStartupLaunchMessage = false;
        showDesktopNotification = true;
        showAbortNotification = false;
        savePath = "${profileInfo.externalDiskPath}/3_photos_videos/screenshots";
        saveAsFileExtension = "jpg";
        useGrimAdapter = true;
        disabledGrimWarning = true;
        uiColor = "#970303";
        drawColor = "#970303";
      };
    };
  };
}
