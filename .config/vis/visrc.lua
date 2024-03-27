require('vis')

vis:command_register("grep", function()
    local status, output = vis:pipe("grep --recursive --line-number '' 2>/dev/null | fzy")

    if status == 0 then
        local filename = string.find(output, ":")

        if filename then
            local linenumber = string.find(output, ":", filename + 1)

            if linenumber then
                vis:command(string.format("open %s", string.sub(output, 0, filename - 1)))
                vis.win.selection:to(tonumber(string.sub(output, filename + 1, linenumber - 1)), 0)
            end
        end
    end

    vis:redraw()
end, "fuzzy grep")

vis.events.subscribe(vis.events.INIT, function()
    vis:command("set theme catppuccin-mocha")
    vis:command("set autoindent on")
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
    vis:command("set number")
    vis:command("set expandtab on")
    vis:command("set tabwidth 4")
end)