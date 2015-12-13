proc(_execute, @array, @messages, @config,

	_cmd_default_player(@array, 0)
	@p = _better_player(@array[0])
	_find_player(@p, @messages)
	set_phunger(@p, 20)
	msg(colorize('&4' .@p @messages['feed']['feed_to']))

)