proc(_commands,
return(import('chessentials.commands'))
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

proc(_register_commands,
@array = array()
foreach(@value in list_files('commands/')) {
	include('commands/'.@value)
	if(array_contains(get_procedures(), '_command')) {
		@commands = _command()
		foreach(@cmd in @commands) {
			array_set(@array, @cmd, @value)
		}
	}
}
export('chessentials.commands', @array)
)
