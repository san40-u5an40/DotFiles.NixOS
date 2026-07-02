{
  programs.hyprlock = {
    enable = true;
    settings =
      {
        background = {
          monitor = "eDP-1";
          path = "~/.config/nix/home-manager/desktop-environment/pics/walls/wallhaven_76yqy9.jpg";
          contrast = 0.8916;
          brightness = 0.8916;
          vibrancy = 0.8916;
          vibrancy_darkness = 0.0;
        };

        input-field = {
          monitor = "eDP-1";
          outline_thickness = 0;
          dots_size = 0.2;
          dots_spacing = 0.2;
          font_size = 16;
          size = "320, 55";
          inner_color = "rgba (255, 255, 255, 0.1)";
          font_color = "rgba (216, 222, 233, 0.80)";
          check_color = "rgba (0, 255, 0, 0.6)";
          fail_color = "rgba (255, 0, 0, 0.6)";
          fade_on_empty = false;
          placeholder_text = "  Enter Pass";
          position = "0, -220";
        };

        image = {
          monitor = "eDP-1";
          path = "~/.config/nix/home-manager/desktop-environment/pics/avatar.jpg";
          border_size = 2;
          border_color = "rgba (34, 84, 150, 0.71)";
          size = 150;
          position = "0, 200";
        };

        label = [
          {
            monitor = "eDP-1";
            text = "$TIME";
            color = "rgba (216, 222, 233, 0.80)";
            font_size = 60;
            position = "0, 10";
          }

          {
            monitor = "eDP-1";
            text = "  $USER";
            color = "rgba (216, 222, 233, 0.80)";
            outline_thickness = 0;
            font_size = 16;
            position = "0, -140";
          }
        ];

        shape = [
          {
            monitor = "eDP-1";
            size = "500, 500";
            color = "rgba(53, 37, 47, 0.62)";
            rounding = 30;
            border_size = 0;
            position = "0, -40";
          }

          {
            monitor = "eDP-1";
            size = "320, 55";
            color = "rgba(255, 255, 255, 0.1)";
            border_size = 0;
            rounding = -1;
            position = "0, -140";
          }
        ];
      };
  };
}
