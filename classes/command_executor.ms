proc(_commands,
return(array('heal': 'heal.ms', 'gamemode': 'gamemode.ms', 'gm': 'gamemode.ms', 'top':'top.ms', 'infotool':'infotool.ms', 'time':'time.ms',
             'sky':'sky.ms', 'weather':'sky.ms', 'lightning':'lightning.ms'))
)

proc(_che_run_cmd, @command, @array, @messages, @config,
		include('commands/'._commands()[@command])
		if(_has_permission()) {
			_execute(@command, @array, @messages, @config)
		} else {
			msg(_pm(@messages[noperm]))
		}
)

proc(_che_has_cmd, @command,
	if(array_index_exists(_commands(), @command)) {
		return(true)
	} else {
		return(false)
	}
)
