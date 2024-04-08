require('vis')
require('plugins/vis-lspc')

function fuzzyGrep(action)
    local status, output = vis:pipe("git grep -rnI --no-index --exclude-standard '' 2>/dev/null | fzy")

    if status == 0 then
        local filename = string.find(output, ":")

        if filename then
            local linenumber = string.find(output, ":", filename + 1)

            if linenumber then
                vis:command(string.format("%s %s", action, string.sub(output, 0, filename - 1)))
                vis.win.selection:to(tonumber(string.sub(output, filename + 1, linenumber - 1)), 0)
            end
        end
    end

    vis:redraw()
end

vis:map(vis.modes.NORMAL, ";g", function()
    fuzzyGrep("e")
end)

vis:map(vis.modes.NORMAL, ";G", function()
    fuzzyGrep("open")
end)

vis.events.subscribe(vis.events.INIT, function()
    vis:command("set theme catppuccin-mocha")
    vis:command("set autoindent on")

    vis:command("set lspc-menu-cmd fzy")
    vis:command("set lspc-confirm-cmd fzy")
    vis:command("set lspc-message-level 1")
    vis:command("set lspc-highlight-diagnostics range")

    local error_style = 'fore:' .. vis.lexers.colors.base08 .. ',italics,underlined'
    local warning_style = 'fore:' .. vis.lexers.colors.base0A .. ',italics,underlined'

    vis:command("set lspc-diagnostic-style-error " .. error_style)
    vis:command("set lspc-diagnostic-style-warning " .. warning_style)
    vis:command("set lspc-diagnostic-style-information " .. warning_style)
    vis:command("set lspc-diagnostic-style-hint " .. warning_style)
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
    vis:command("set number")
    vis:command("set expandtab on")
    vis:command("set tabwidth 4")
end)
