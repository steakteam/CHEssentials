proc(_execute, @array, @messages, @config,

	_cmd_default_player(@array, 0)
	@p = _better_player(@array[0])
	_find_player(@array[0], @messages)
	_pheal(@p)
	_heal_sender(@p, @messages['heal'])

)