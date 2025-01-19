-- Notification
local function notify(title, text)
  hs.notify.new({title=title, informativeText=text}):send()
end

-- Remap keys
local function keyCode(mods, key)
  if key == nil then
      key = mods
      mods = {}
  end

  return function()
      hs.eventtap.event.newKeyEvent(mods, string.lower(key), true):post()
      hs.timer.usleep(1000)
      hs.eventtap.event.newKeyEvent(mods, string.lower(key), false):post()
  end
end

local function remapKey(mods, key, keyCode)
  hs.hotkey.bind(mods, key, keyCode, nil, keyCode)
end

remapKey({'ctrl'}, 'h', keyCode('left'))
remapKey({'ctrl'}, 'j', keyCode('down'))
remapKey({'ctrl'}, 'k', keyCode('up'))
remapKey({'ctrl'}, 'l', keyCode('right'))

remapKey({'ctrl', 'shift'}, 'h', keyCode({'shift'}, 'left'))
remapKey({'ctrl', 'shift'}, 'j', keyCode({'shift'}, 'down'))
remapKey({'ctrl', 'shift'}, 'k', keyCode({'shift'}, 'up'))
remapKey({'ctrl', 'shift'}, 'l', keyCode({'shift'}, 'right'))

remapKey({'ctrl', 'cmd'}, 'h', keyCode({'cmd'}, 'left'))
remapKey({'ctrl', 'cmd'}, 'j', keyCode({'cmd'}, 'down'))
remapKey({'ctrl', 'cmd'}, 'k', keyCode({'cmd'}, 'up'))
remapKey({'ctrl', 'cmd'}, 'l', keyCode({'cmd'}, 'right'))

remapKey({'ctrl', 'alt'}, 'h', keyCode({'alt'}, 'left'))
remapKey({'ctrl', 'alt'}, 'j', keyCode({'alt'}, 'down'))
remapKey({'ctrl', 'alt'}, 'k', keyCode({'alt'}, 'up'))
remapKey({'ctrl', 'alt'}, 'l', keyCode({'alt'}, 'right'))

remapKey({'ctrl', 'shift', 'cmd'}, 'h', keyCode({'shift', 'cmd'}, 'left'))
remapKey({'ctrl', 'shift', 'cmd'}, 'j', keyCode({'shift', 'cmd'}, 'down'))
remapKey({'ctrl', 'shift', 'cmd'}, 'k', keyCode({'shift', 'cmd'}, 'up'))
remapKey({'ctrl', 'shift', 'cmd'}, 'l', keyCode({'shift', 'cmd'}, 'right'))

remapKey({'ctrl', 'shift', 'alt'}, 'h', keyCode({'shift', 'alt'}, 'left'))
remapKey({'ctrl', 'shift', 'alt'}, 'j', keyCode({'shift', 'alt'}, 'down'))
remapKey({'ctrl', 'shift', 'alt'}, 'k', keyCode({'shift', 'alt'}, 'up'))
remapKey({'ctrl', 'shift', 'alt'}, 'l', keyCode({'shift', 'alt'}, 'right'))

remapKey({'ctrl', 'cmd', 'alt'}, 'h', keyCode({'cmd', 'alt'}, 'left'))
remapKey({'ctrl', 'cmd', 'alt'}, 'j', keyCode({'cmd', 'alt'}, 'down'))
remapKey({'ctrl', 'cmd', 'alt'}, 'k', keyCode({'cmd', 'alt'}, 'up'))
remapKey({'ctrl', 'cmd', 'alt'}, 'l', keyCode({'cmd', 'alt'}, 'right'))

remapKey({'ctrl', 'cmd', 'alt', 'shift'}, 'h', keyCode({'cmd', 'alt', 'shift'}, 'left'))
remapKey({'ctrl', 'cmd', 'alt', 'shift'}, 'j', keyCode({'cmd', 'alt', 'shift'}, 'down'))
remapKey({'ctrl', 'cmd', 'alt', 'shift'}, 'k', keyCode({'cmd', 'alt', 'shift'}, 'up'))
remapKey({'ctrl', 'cmd', 'alt', 'shift'}, 'l', keyCode({'cmd', 'alt', 'shift'}, 'right'))

remapKey({'ctrl'}, 'v', keyCode('pagedown'))
remapKey({'alt'}, 'v', keyCode('pageup'))
remapKey({'cmd', 'shift'}, ',', keyCode('home'))
remapKey({'cmd', 'shift'}, '.', keyCode('end'))

-- Reload Config
local function reloadConfig(files)
  doReload = false
  for _,file in pairs(files) do
      if file:sub(-4) == ".lua" then
          doReload = true
      end
  end
  if doReload then
      hs.reload()
  end
end

hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
notify('Hammerspoon', 'Config loaded')