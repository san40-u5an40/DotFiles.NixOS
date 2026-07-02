{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      preferred = {
        default = "hyprland;gtk";
        "org.freedesktop.impl.portal.FileChooser" = "gtk";
      };
    };
  };
}
