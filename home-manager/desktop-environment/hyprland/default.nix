{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    extraConfig = ''
      require('binds')
      require('environment')
      require('events')
      require('monitor')
      require('variables')
      require('window-rules')
    '';
  };

  home.file = {
    ".config/hypr" = {
      source = ./configuration;
      recursive = true;
    };
  };

  home.packages = with pkgs; [
    qt5.qtwayland
    qt6.qtwayland
    wl-clipboard
    hyprpicker
    hyprpwcenter
    wireplumber
  ];
}
