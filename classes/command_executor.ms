proc(_commands,
return(array('/heal': 'heal.ms', '/test': 'test.ms'))
)

proc(_che_run_cmd, @command, @array, @messages, @config,
	include('commands/'._commands()[@command])
	_execute(@array, @messages, @config)
)

proc(_che_has_cmd, @command,
	if(array_index_exists(_commands(), @command)) {
		return(true)
		msg('true')
	} else {
		return(false)
	}
)