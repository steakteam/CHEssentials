proc _commands() {
	return(import('chessentials.commands'))
}

proc _che_run_cmd(@command, @array, @messages, @config) {
		include('commands/'._commands()[@command])
		if(_has_permission()) {
			_execute(@command, @array, @messages, @config)
		} else {
			msg(_pm(@messages[noperm]))
		}
}

proc _che_has_cmd(@command) {
	if(array_index_exists(_commands(), @command)) {
		return(true)
	} else {
		return(false)
	}
}

proc _register_commands() {
	@array = array()
	foreach(@value in list_files('commands/')) {
		include('commands/'.@value)
		@commands = _command()
		foreach(@cmd in @commands) {
			array_set(@array, @cmd, @value)
		}
		if(array_size(@commands) > 0) {
			@maincmd = @commands[0]
			array_remove(@commands, 0)
			try(register_command(@maincmd, array('aliases': @commands)))
		}
	}
	export('chessentials.commands', @array)
	bind(player_command, null, null, @e,
		@string = split('', @e[prefix])
		@prefix = to_lower(replace(@e[prefix], '/', ''))
		if(_che_has_cmd(@prefix)) {
			cancel()
			@array = split(' ', @e[command])
			array_remove(@array, 0)
			_che_run_cmd(@prefix, @array, import('chessentials.messages'), import('chessentials.config'))
		} else {
			@prefix = replace(@e[prefix], '/che', '')
			if(_che_has_cmd(@prefix)) {
				cancel()
				@array = split(' ', @e[command])
				array_remove(@array, 0)
				_che_run_cmd(@prefix, @array, import('chessentials.messages'), import('chessentials.config'))
			}
		}
		modify_event('command', @e[command])
	)
}
