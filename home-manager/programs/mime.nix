{
  xdg = {
    configFile."mimeapps.list".force = true;
    dataFile."applications/mimeapps.list".force = true;

    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/sql" = [ "mysql-workbench.desktop" ];
        "application/vnd.mysql-workbench-model" = [ "mysql-workbench.desktop" ];
        "x-scheme-handler/steam" = [ "steam.desktop" ];
        "x-scheme-handler/steamlink" = [ "steam.desktop" ];
        "x-scheme-handler/http" = [ "librewolf.desktop" ];
        "x-scheme-handler/https" = [ "librewolf.desktop" ];
        "text/html" = [ "librewolf.desktop" ];
        "video/mp4" = [ "mpv.desktop" ];
        "video/mkv" = [ "mpv.desktop" ];
        "video/avi" = [ "mpv.desktop" ];
        "video/mov" = [ "mpv.desktop" ];
        "video/webm" = [ "mpv.desktop" ];
        "video/flv" = [ "mpv.desktop" ];
        "video/wmv" = [ "mpv.desktop" ];
        "video/asf" = [ "mpv.desktop" ];
        "video/x-matroska" = [ "mpv.desktop" ];
        "image/jpeg" = [ "org.kde.gwenview.desktop" ];
        "image/jpg" = [ "org.kde.gwenview.desktop" ];
        "image/png" = [ "org.kde.gwenview.desktop" ];
        "image/bmp" = [ "org.kde.gwenview.desktop" ];
        "image/tiff" = [ "org.kde.gwenview.desktop" ];
        "image/tif" = [ "org.kde.gwenview.desktop" ];
        "image/gif" = [ "org.kde.gwenview.desktop" ];
        "image/svg+xml" = [ "org.kde.gwenview.desktop" ];
        "image/raw" = [ "org.kde.gwenview.desktop" ];
        "audio/flac" = [ "tauonmb.desktop" ];
        "audio/ape" = [ "tauonmb.desktop" ];
        "audio/tta" = [ "tauonmb.desktop" ];
        "audio/wv" = [ "tauonmb.desktop" ];
        "audio/mp3" = [ "tauonmb.desktop" ];
        "audio/ogg" = [ "tauonmb.desktop" ];
        "audio/opus" = [ "tauonmb.desktop" ];
        "audio/xspf" = [ "tauonmb.desktop" ];
        "audio/cue" = [ "tauonmb.desktop" ];
        "audio/lrc" = [ "tauonmb.desktop" ];
      };
    };
  };
}
