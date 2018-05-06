local pushWindowKeys =  {"cmd", "ctrl"}

hs.window.animationDuration = 0

hs.hotkey.bind(pushWindowKeys, "Left", function ()
  local window = hs.window.focusedWindow()
  local frame = window:frame()
  local maxFrame = window:screen():frame()

  frame.x = maxFrame.x
  frame.y = maxFrame.y
  frame.w = maxFrame.w / 2
  frame.h = maxFrame.h

  window:setFrame(frame)
end)

hs.hotkey.bind(pushWindowKeys, "Right", function ()
  local window = hs.window.focusedWindow()
  local frame = window:frame()
  local maxFrame = window:screen():frame()

  frame.x = maxFrame.w / 2
  frame.y = maxFrame.y
  frame.w = maxFrame.w / 2
  frame.h = maxFrame.h

  window:setFrame(frame)
end)

hs.hotkey.bind(pushWindowKeys, "Up", function ()
  local window = hs.window.focusedWindow()
  local frame = window:frame()
  local maxFrame = window:screen():frame()

  frame.x = maxFrame.x
  frame.y = maxFrame.y
  frame.w = maxFrame.w
  frame.h = maxFrame.h / 2

  window:setFrame(frame)
end)

hs.hotkey.bind(pushWindowKeys, "Down", function ()
  local window = hs.window.focusedWindow()
  local frame = window:frame()
  local maxFrame = window:screen():frame()

  frame.x = maxFrame.x
  frame.y = maxFrame.h / 2
  frame.w = maxFrame.w
  frame.h = maxFrame.h / 2

  window:setFrame(frame)
end)

hs.hotkey.bind(pushWindowKeys, "M", function ()
  local window = hs.window.focusedWindow()
  local frame = window:frame()
  local maxFrame = window:screen():frame()

  frame.x = maxFrame.x
  frame.y = maxFrame.y
  frame.w = maxFrame.w
  frame.h = maxFrame.h

  window:setFrame(frame)
end)
