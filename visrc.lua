require('vis')

vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options
	vis:command("set theme base16-onedark")
	vis:command("set autoindent on")
	vis:command("set tabwidth 4")
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	-- Your per window configuration options e.g.
	vis:command('set number')
end)
