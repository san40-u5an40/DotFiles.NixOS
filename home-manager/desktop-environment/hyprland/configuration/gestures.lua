local noctalia = "noctalia-shell ipc call "

hl.gesture({
  fingers = 3,
  direction = "left",
  action = function()
    hl.exec_cmd(noctalia .. "media previous")
  end
})

hl.gesture({
  fingers = 3,
  direction = "right",
  action = function()
    hl.exec_cmd(noctalia .. "media next")
  end
})
