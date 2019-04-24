function resize_win(direction)
    local win = hs.window.focusedWindow()
    if win then
        local f = win:frame()
        local screen = win:screen()
        local localf = screen:absoluteToLocal(f)
        local max = screen:fullFrame()
        local stepw = max.w/30
        local steph = max.h/30
        if direction == "right" then
            localf.w = localf.w+stepw
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "left" then
            localf.w = localf.w-stepw
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "up" then
            localf.h = localf.h-steph
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "down" then
            localf.h = localf.h+steph
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "halfright" then
            localf.x = max.w/2 localf.y = 0 localf.w = max.w/2 localf.h = max.h
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "halfleft" then
            localf.x = 0 localf.y = 0 localf.w = max.w/2 localf.h = max.h
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "halfup" then
            localf.x = 0 localf.y = 0 localf.w = max.w localf.h = max.h/2
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "halfdown" then
            localf.x = 0 localf.y = max.h/2 localf.w = max.w localf.h = max.h/2
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "cornerNE" then
            localf.x = max.w/2 localf.y = 0 localf.w = max.w/2 localf.h = max.h/2
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "cornerSE" then
            localf.x = max.w/2 localf.y = max.h/2 localf.w = max.w/2 localf.h = max.h/2
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "cornerNW" then
            localf.x = 0 localf.y = 0 localf.w = max.w/2 localf.h = max.h/2
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "cornerSW" then
            localf.x = 0 localf.y = max.h/2 localf.w = max.w/2 localf.h = max.h/2
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "center" then
            localf.x = (max.w-localf.w)/2 localf.y = (max.h-localf.h)/2
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "fcenter" then
            localf.x = stepw*5 localf.y = steph*5 localf.w = stepw*20 localf.h = steph*20
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "fullscreen" then
            win:toggleFullScreen()
        end
        if direction == "maximize" then
            -- localf.x = 0 localf.y = 0 localf.w = max.w localf.h = max.h
            -- local absolutef = screen:localToAbsolute(localf)
            -- win:setFrame(absolutef)
            toggle_window_maximized()
        end
        if direction == "shrink" then
            localf.x = localf.x+stepw localf.y = localf.y+steph localf.w = localf.w-(stepw*2) localf.h = localf.h-(steph*2)
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "expand" then
            localf.x = localf.x-stepw localf.y = localf.y-steph localf.w = localf.w+(stepw*2) localf.h = localf.h+(steph*2)
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "mright" then
            localf.x = localf.x+stepw
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "mleft" then
            localf.x = localf.x-stepw
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "mup" then
            localf.y = localf.y-steph
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "mdown" then
            localf.y = localf.y+steph
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "ccursor" then
            localf.x = localf.x+localf.w/2 localf.y = localf.y+localf.h/2
            hs.mouse.setRelativePosition({x=localf.x,y=localf.y},screen)
        end
    else
        hs.alert.show("No focused window!")
    end
end

-- Toggle a window between its normal size, and being maximized
local frameCache = {}
function toggle_window_maximized()
    local win = hs.window.focusedWindow()
    if frameCache[win:id()] then
       win:setFrame(frameCache[win:id()])
       frameCache[win:id()] = nil
    else
       frameCache[win:id()] = win:frame()
       win:maximize()
    end
 end

mod0 =   {"cmd", "ctrl", "shift"}

resize_win_bindings = {
    { key = {mod0, "left"},  dir = "halfleft", tip = "Lefthalf of Screen" },
    { key = {mod0, "right"}, dir = "halfright", tip = "Righthalf of Screen" },
    { key = {mod0, "up"},    dir = "halfup", tip = "Uphalf of Screen" },
    { key = {mod0, "down"},  dir = "halfdown", tip = "Downhalf of Screen" },
    { key = {mod0, "O"},     dir = "cornerNE", tip = "NorthEast Corner" },
    { key = {mod0, "Y"},     dir = "cornerNW", tip = "NorthWest Corner" },
    { key = {mod0, "U"},     dir = "cornerSW", tip = "SouthWest Corner" },
    { key = {mod0, "I"},     dir = "cornerSE", tip = "SouthEast Corner" },
    { key = {mod0, "C"},     dir = "center", tip = "Center Window" },
    { key = {mod0, "M"},     dir = "maximize", tip = "Maximize Window" },
    { key = {mod0, "F"},     dir = "fullscreen", tip = "Fullscreen Window" },
}

hs.fnutils.each(resize_win_bindings, function(item)
    hs.hotkey.bind(item.key[1], item.key[2], item.tip, function() resize_win(item.dir) end)
end)
