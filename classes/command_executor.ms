proc(_commands,
return(array('heal': 'heal.ms', 'gamemode': 'gamemode.ms', 'gm': 'gamemode.ms'))
)

proc(_che_run_cmd, @command, @array, @messages, @config,
	if(has_permission(player(), 'che.command.'.@prefix)) {
		include('commands/'._commands()[@command])
		_execute(@command, @array, @messages, @config)
	} else {
		msg(colorize(@message[noperm]))
	}
)

proc(_che_has_cmd, @command,
	if(array_index_exists(_commands(), @command)) {
		return(true)
		msg('true')
	} else {
		return(false)
	}
)