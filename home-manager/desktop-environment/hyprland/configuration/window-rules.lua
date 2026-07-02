hl.window_rule({
  match = {
    fullscreen = true, 
  },
  opacity = "1.0",
  no_blur = true,
})

hl.window_rule({
  match = {
    workspace = "special:magic", 
  },
  opacity = "1.0",
  no_blur = true,
  no_screen_share = true,
  float = true,
})

hl.window_rule({
  match = {
    title = ".*ueberzugpp.*";
  },
  float = true,
  center = true,
  no_initial_focus = true,
  no_focus = true,
  no_follow_mouse = true,
})

hl.window_rule({
  match = {
    content = "photo";
  },
  no_blur = true,
  opacity = "1.0",
})

hl.window_rule({
  match = {
    title = "Добро пожаловать в Borderlands 2",
  },
  float = true,
  center = true,
  no_blur = true,
  opacity = "1.0",
})

hl.window_rule({
  match = {
    class = "Alacritty";
  },
  workspace = "1",
})

hl.window_rule({
  match = {
    class = "librewolf";
  },
  workspace = "2",
})

hl.window_rule({
  match = {
    class = "obsidian";
  },
  workspace = "3",
})

hl.window_rule({
  match = {
    class = "org.telegram.desktop";
  },
  workspace = "4",
})
