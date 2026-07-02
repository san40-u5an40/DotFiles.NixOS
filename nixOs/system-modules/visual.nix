{ profileInfo, ... }:
{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  services.getty.autologinUser = profileInfo.user;
  environment.loginShellInit = ''
    if uwsm check may-start; then
      exec uwsm start hyprland.desktop
    fi
  '';
}
