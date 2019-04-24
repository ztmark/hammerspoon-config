local function Chinese()
   hs.keycodes.currentSourceID("com.apple.inputmethod.SCIM.ITABC")
end

local function English()
    hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
end

-- app to expected ime config
local app2Ime = {
    {'/Applications/iTerm.app', 'English'},
    {'/Applications/Xcode.app', 'English'},
    {'/Applications/Visual Studio Code.app', 'English'},
    {'/Applications/IntelliJ IDEA.app', 'English'},
    {'/Applications/DataGrip.app', 'English'},
    {'/Applications/LastPass.app', 'English'},
    {'/Applications/Telegram.app', 'Chinese'},
    {'/Applications/AppCleaner.app', 'English'},
    {'/Applications/Google Chrome.app', 'English'},
    {'/Applications/Dash.app', 'English'},
    {'/Applications/System Preferences.app', 'English'},
    {'/System/Library/CoreServices/Spotlight.app', 'English'},
    {'/System/Library/CoreServices/Finder.app', 'English'},
}

function updateFocusAppInputMethod()
    local ime = 'English'
    local focusAppPath = hs.window.focusedWindow():application():path()
    for index, app in pairs(app2Ime) do
        local appPath = app[1]
        local expectedIme = app[2]

        if focusAppPath == appPath then
            ime = expectedIme
            break
        end
    end

    if ime == 'English' then
        English()
    else
        Chinese()
    end
end

-- helper hotkey to figure out the app path and name of current focused window
hs.hotkey.bind({'ctrl', 'cmd'}, ".", function()
    hs.alert.show("App path:        "
    ..hs.window.focusedWindow():application():path()
    .."\n"
    .."App name:      "
    ..hs.window.focusedWindow():application():name()
    .."\n"
    .."IM source id:  "
    ..hs.keycodes.currentSourceID())
end)

-- Handle cursor focus and application's screen manage.
function applicationWatcher(appName, eventType, appObject)
    if (eventType == hs.application.watcher.activated) then
        updateFocusAppInputMethod()
    end
end

appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()