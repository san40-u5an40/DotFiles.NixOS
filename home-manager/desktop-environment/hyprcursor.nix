{ pkgs, cursor, ... }:
{
  home.pointerCursor = {
    name = "rose-pine-hyprcursor";
    package = cursor.packages.${pkgs.stdenv.hostPlatform.system}.default;
    hyprcursor = {
      enable = true;
      size = 32;
    };
  };
}
