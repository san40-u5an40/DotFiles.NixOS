{ profileInfo, ... }:
{
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        showStartupLaunchMessage = false;
        showDesktopNotification = true;
        showAbortNotification = false;
        savePath = "/home/${profileInfo.user}/Screenshots";
        saveAsFileExtension = "jpg";
        useGrimAdapter = true;
        disabledGrimWarning = true;
        uiColor = "#970303";
        drawColor = "#970303";
      };
    };
  };
}
