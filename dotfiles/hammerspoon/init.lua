-- Hammerspoon 配置: 自动全屏新应用

-- 需要自动全屏的应用列表
local appsToFullscreen = {
    "Google Chrome",
    "Safari",
    "Code",
    "Visual Studio Code",
    "Terminal",
    "iTerm",
    "Ghostty",
    -- 在这里添加更多应用名称
}

-- 创建应用名称的查找表以提高性能
local appsToFullscreenSet = {}
for _, appName in ipairs(appsToFullscreen) do
    appsToFullscreenSet[appName] = true
end

-- 监听应用启动事件
appWatcher = hs.application.watcher.new(function(appName, eventType, appObject)
    if eventType == hs.application.watcher.launched then
        -- 检查是否是需要全屏的应用
        if appsToFullscreenSet[appName] then
            -- 延迟一小段时间确保窗口已完全加载
            hs.timer.doAfter(0.5, function()
                if appObject and appObject:mainWindow() then
                    appObject:mainWindow():setFullScreen(true)
                    hs.notify.new({
                        title = "Auto Fullscreen",
                        informativeText = appName .. " 已自动全屏"
                    }):send()
                end
            end)
        end
    end
end)

appWatcher:start()

-- 显示配置加载成功提示
hs.notify.new({
    title = "Hammerspoon",
    informativeText = "自动全屏配置已加载"
}):send()

print("Hammerspoon 自动全屏配置已加载")