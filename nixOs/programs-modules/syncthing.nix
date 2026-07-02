{ profileInfo, ... }:
{
  services.syncthing = {
    enable = true;
    user = profileInfo.user;
    group = "users";
    openDefaultPorts = true;
  };
}
