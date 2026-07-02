hl.config({
  animations = {
    enabled = false,
  },
  decoration = {
    rounding = 5,
    active_opacity = 0.95,
    inactive_opacity = 0.95,
    blur = {
      enabled = true,
    },
    shadow = {
      enabled = true,
    },
  },
  general = {
    allow_tearing = false,
    border_size = 3,
    col = {
      active_border = {
        colors = {
          "rgba(d65d0eff)",
          "rgba(98971aff)"
        },
        angle = 45
      },
      inactive_border = "rgba(3c3836ff)",
    },
    gaps_in = 5,
    gaps_out = 10,
    layout = "dwindle",
    resize_on_border = true
  },
  dwindle = {
    force_split = 1,
    preserve_split = true,
  },
  gestures = {
    workspace_swipe_touch = true,
  },
  input = {
    kb_layout = "us,ru",
    kb_options = "grp:win_space_toggle",
    sensitivity = 0.0,
    force_no_accel = true,
    follow_mouse = 0,
    touchpad = {
      natural_scroll = false,
    },
  },
  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = false,
    font_family = "JetBrainsMono Nerd Font",
    force_default_wallpaper = 0,
    vrr = 2,
  },
})
