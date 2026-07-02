-- Local variables
local mod = "SUPER + "
local noctalia = "noctalia-shell ipc call "

-- Session logic
hl.bind(mod .. "SHIFT + Q", hl.dsp.exec_cmd("systemctl poweroff"))
hl.bind(mod .. "Q", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mod .. "R", hl.dsp.exec_cmd("hyprctl reload"))

-- Programs
hl.bind(mod .. "Return", hl.dsp.exec_cmd("alacritty"))
hl.bind(mod .. "P", hl.dsp.exec_cmd("hyprpicker -a -f hex"))
hl.bind(mod .. "I", hl.dsp.exec_cmd("flameshot gui"))
hl.bind(mod .. "M", hl.dsp.exec_cmd(noctalia .. "launcher toggle"))
hl.bind(mod .. "E", hl.dsp.exec_cmd(noctalia .. "launcher emoji"))

-- Noctalia control
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(noctalia .. "volume increase"), { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(noctalia .. "volume decrease"), { repeating = true, locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(noctalia .. "volume muteOutput"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(noctalia .. "volume muteInput"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(noctalia .. "brightness increase"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(noctalia .. "brightness decrease"), { repeating = true, locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(noctalia .. "media playPause"), { locked = true })
hl.bind("XF86AudioStop", hl.dsp.exec_cmd(noctalia .. "media stop"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(noctalia .. "media previous"), { repeating = true, locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(noctalia .. "media next"), { repeating = true, locked = true })

-- Window base logic
hl.bind(mod .. "H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. "L", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. "K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. "J", hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. "SHIFT + H", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mod .. "SHIFT + L", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mod .. "SHIFT + K", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mod .. "SHIFT + J", hl.dsp.window.swap({ direction = "down" }))

-- Window special logic
hl.bind(mod .. "F", hl.dsp.window.float())
hl.bind(mod .. "SHIFT + F", hl.dsp.window.fullscreen())
hl.bind(mod .. "C", hl.dsp.window.center())
hl.bind(mod .. "X", hl.dsp.window.close())
hl.bind(mod .. "SHIFT + X", hl.dsp.window.kill())

-- Workspace logic
for i = 1, 10 do
  local key = i % 10
  hl.bind(mod .. "" .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mod .. "SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
hl.bind(mod .. "S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mod .. "SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Mouse logic
hl.bind(mod .. "mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. "mouse:273", hl.dsp.window.resize(), { mouse = true })
