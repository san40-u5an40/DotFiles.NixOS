{ profileInfo, ... }: {
  imports = [
    ./desktop-environment
    ./programs
  ];

  home = {
    username = profileInfo.user;
    homeDirectory = "/home/${profileInfo.user}";
    stateVersion = profileInfo.stateVersion;
  };
}
