{ profileInfo, ... }:
{
  users.users.${profileInfo.user} = {
    isNormalUser = true;
    description = profileInfo.user;
    extraGroups = [ "networkmanager" "wheel" ];
    hashedPassword = "$6$M.xF50erThdEFaT3$3/e6yjzqFAhRefCSWmpqbiCidj57r0NjPyOo4CCeIkXQP.r9X9sWYeAKfz/Sd.Ao143zjIllONmPTM4i0WTtR0";
    packages = [];
  };
  services.getty.autologinUser = profileInfo.user;
}
