require('vis')

vis.events.subscribe(vis.events.INIT, function()
    vis:command("set theme catppuccin-mocha")
    vis:command("set autoindent on")
    vis:command("set expandtab on")
    vis:command("set tabwidth 4")
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
    vis:command('set number')
end)