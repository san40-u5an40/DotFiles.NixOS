{ pkgs, profileInfo, ... }:
{
  programs.alacritty = {
    enable = true;

    settings = {
      general = {
        live_config_reload = true;
      };

      env = {
        TERM = "xterm-256color";
      };

      window = {
        startup_mode = "Windowed";
        opacity = 1.00;

        padding = {
          x = 15;
          y = 15;
        };

        decorations = "None";
        title = "Alacritty";
        dynamic_title = true;
      };

      scrolling = {
        history = profileInfo.historyLength;
        multiplier = 3;
      };

      cursor = {
        style = {
          shape = "Block";
          blinking = "On";
        };
      };

      terminal = {
        shell = {
          #program = "${pkgs.zsh}/bin/zsh";
          #args = [ "-l" ];
          program = "${pkgs.tmux}/bin/tmux";
          args = [ "-u" ];
        };
      };

      keyboard = {
        bindings = [
          {
            key = "V";
            mods = "Control|Shift";
            action = "Paste";
          }
          {
            key = "C";
            mods = "Control|Shift";
            action = "Copy";
          }
          {
            key = "F";
            mods = "Control|Shift";
            action = "ToggleFullscreen";
          }
          {
            key = "Equals";
            mods = "Control|Shift";
            action = "IncreaseFontSize";
          }
          {
            key = "Minus";
            mods = "Control|Shift";
            action = "DecreaseFontSize";
          }
          {
            key = "0";
            mods = "Control|Shift";
            action = "ResetFontSize";
          }
          {
            key = "J";
            mods = "Control|Shift";
            action = "ScrollToTop";
          }
          {
            key = "K";
            mods = "Control|Shift";
            action = "ScrollToBottom";
          }
          {
            key = "Q";
            mods = "Control|Shift";
            action = "Quit";
          }
        ];
      };

      mouse = {
        hide_when_typing = true;
        bindings = [
          {
            mouse = "Right";
            action = "ExpandSelection";
          }
        ];
      };

      selection = {
        semantic_escape_chars = ",│`|:\"' ()[]{}<>\t";
        save_to_clipboard = true;
      };
    };
  };
}
