


local function Chinese()
    hs.keycodes.currentSourceID("com.apple.inputmethod.SCIM.ITABC")
end

local function English()
    hs.keycodes.currentSourceID("com.apple.keylayout.US")
end

local function set_app_input_method(app_name, set_input_method_function, event)
    event = event or hs.window.filter.windowFocused
    print(event)
    hs.window.filter.new(app_name)
        :subscribe(event, function()
                    set_input_method_function()
                end)
end


set_app_input_method('Hammerspoon', English, hs.window.filter.windowCreated)
set_app_input_method('聚焦', English, hs.window.filter.windowCreated)
set_app_input_method('iTerm2', English)
set_app_input_method('终端', English)
set_app_input_method('Xcode', English)
set_app_input_method('IntelliJ IDEA', English)
set_app_input_method('DataGrip', English)
set_app_input_method('Code', English)
set_app_input_method('Sublime Text', English)
set_app_input_method('Google Chrome', English)
set_app_input_method('AppCleaner', English)
set_app_input_method('Dash', English)

set_app_input_method('WeChat', Chinese)
set_app_input_method('微信', Chinese)
set_app_input_method('Typora', Chinese)
set_app_input_method('Telegram', Chinese)
set_app_input_method('Notebook', Chinese)
