proc(_commands,
return(array('/heal': 'heal.ms', '/test': 'test.ms', '/gm': 'gm.ms', '/feed': 'feed.ms'))
)

proc(_cmd_procs,
return(array('heal': 'proc_heal.ms', 'gm': 'proc_gm.ms'))
)

proc(_che_run_cmd, @command, @array, @messages, @config,
	include('commands/'._commands()[@command])
	_execute(@array, @messages, @config)
)

proc(_che_has_cmd, @command,
	if(array_index_exists(_commands(), @command)) {
		return(true)
	} else {
		return(false)
	}
)

proc(_load_procs,

	@values = _cmd_procs()
	foreach(@key: @value in @values){

		include('procedure/'.@key.'/'.@value)
	
	}

)