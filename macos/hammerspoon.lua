hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function ()
  local window = hs.window.focusedWindow()
  local frame = window:frame()
  local maxFrame = window:screen():frame()

  frame.x = maxFrame.x
  frame.y = maxFrame.y
  frame.w = maxFrame.w / 2
  frame.h = maxFrame.h

  window:setFrame(frame)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function ()
  local window = hs.window.focusedWindow()
  local frame = window:frame()
  local maxFrame = window:screen():frame()

  frame.x = maxFrame.w / 2
  frame.y = maxFrame.y
  frame.w = maxFrame.w / 2
  frame.h = maxFrame.h

  window:setFrame(frame)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Up", function ()
  local window = hs.window.focusedWindow()
  local frame = window:frame()
  local maxFrame = window:screen():frame()

  frame.x = maxFrame.x
  frame.y = maxFrame.y
  frame.w = maxFrame.w
  frame.h = maxFrame.h / 2

  window:setFrame(frame)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Down", function ()
  local window = hs.window.focusedWindow()
  local frame = window:frame()
  local maxFrame = window:screen():frame()

  frame.x = maxFrame.x
  frame.y = maxFrame.h / 2
  frame.w = maxFrame.w
  frame.h = maxFrame.h / 2

  window:setFrame(frame)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "M", function ()
  local window = hs.window.focusedWindow()
  local frame = window:frame()
  local maxFrame = window:screen():frame()

  frame.x = maxFrame.x
  frame.y = maxFrame.y
  frame.w = maxFrame.w
  frame.h = maxFrame.h

  window:setFrame(frame)
end)
