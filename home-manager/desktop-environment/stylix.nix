{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nerd-fonts.hack
    nerd-fonts.fira-code
    nerd-fonts.agave
    nerd-fonts.noto
    dejavu_fonts
    font-awesome
  ];

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    polarity = "dark";

    fonts = {
      serif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };

      sansSerif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        applications = 12;
        terminal = 15;
        desktop = 11;
        popups = 12;
      };
    };

    targets = {
      #neovim.enable = false;
      hyprland.enable = false;
      hyprlock.enable = false;
      noctalia-shell.enable = false;
      vscode.enable = false;

      librewolf.profileNames = [ "librewolf" ];
    };
  };
}
