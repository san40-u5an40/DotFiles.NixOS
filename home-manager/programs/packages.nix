{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Desktop
    blanket
    onlyoffice-desktopeditors
    kdePackages.okular
    kdePackages.gwenview
    kdePackages.filelight
    bruno
    simple-scan
    rawtherapee
    gimp
    davinci-resolve
    inkscape
    lmstudio
    mpv
    tauon
    obs-studio
    obsidian
    telegram-desktop
    discord
    veracrypt
    keepass
    mitmproxy

    # CLI utils
    ueberzugpp
    wev
    htop
    cmatrix
    tree
    eza
    tmux
    bc
    ffmpeg
    ffmpegthumbnailer
    mediainfo
    fastfetch
    ripgrep
    unzip
    zip
    wget
    curl
    yt-dlp

    # Nix
    nix-prefetch-scripts
  ];
}
