{ pkgs, profileInfo, ... }:
{
  programs.tmux = {
    enable = true;

    terminal = "tmux-256color";
    baseIndex = 1;
    escapeTime = 0;
    historyLimit = profileInfo.historyLength;
    keyMode = "vi";

    mouse = true;
    shell = "${pkgs.zsh}/bin/zsh";

    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      open
      resurrect
      continuum
    ];

    extraConfig = ''
      bind - split-window -v -c "#{pane_current_path}"
      bind \\ split-window -h -c "#{pane_current_path}"
    
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
    
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5
    
      set -g status-left-length 20
      set -g status-right-length 80
      set -g status-interval 5
      set -g status-style bg=default
      set -g status-justify centre
    
      set -g mouse on
      set -g monitor-activity on
      set -g visual-activity off
      set -g visual-silence off
      set -g visual-bell off
    '';
  };
}
