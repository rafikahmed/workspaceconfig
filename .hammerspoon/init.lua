-- Work layout configuration
local function workLayout()
  -- Get all available screens
  local screens = hs.screen.allScreens()
  
  -- Only proceed if we have at least 3 screens
  if #screens >= 3 then

      -- Handle Chrome
      local chrome = hs.application.find('Google Chrome')
      if not chrome then
          chrome = hs.application.open('Google Chrome')
          hs.timer.waitUntil(
              function() return chrome:mainWindow() ~= nil end,
              function()
                  local win = chrome:mainWindow()
                  win:moveToScreen(screens[1])
                  win:maximize()
              end,
              0.5
          )
      else
          local win = chrome:mainWindow()
          if win then
              win:moveToScreen(screens[1])
              win:maximize()
          end
      end

        -- Handle Slack
        local slack = hs.application.find('Slack')
        if not slack then
            slack = hs.application.open('Slack')
            -- Wait for the application to launch
            hs.timer.waitUntil(
                function() return slack:mainWindow() ~= nil end,
                function()
                    local win = slack:mainWindow()
                    win:moveToScreen(screens[2])
                    win:maximize()
                end,
                0.5  -- Check every 0.5 seconds
            )
        else
            local win = slack:mainWindow()
            if win then
                win:moveToScreen(screens[2])
                win:maximize()
            end
        end

      -- Handle Cursor
      local cursor = hs.application.find('Cursor')
      if not cursor then
          cursor = hs.application.open('Cursor')
          hs.timer.waitUntil(
              function() return cursor:mainWindow() ~= nil end,
              function()
                  local win = cursor:mainWindow()
                  win:moveToScreen(screens[3])
                  win:maximize()
              end,
              0.5
          )
      else
          local win = cursor:mainWindow()
          if win then
              win:moveToScreen(screens[3])
              win:maximize()
          end
      end
  else
      hs.alert.show("Need at least 3 screens for work layout")
  end
end

-- Bind the work layout to cmd+alt+L
hs.hotkey.bind({"cmd", "alt"}, "L", workLayout)