proc(_execute, @array, @messages, @config,

	_cmd_default_player(@array, 1)
	@gm = _gm_check(@array, @messages['gm']['modes'])
	@p = _better_player(@array[1])
	_find_player(@p, @messages)
	
	if(@gm,

		.set_pmode(@p, @gm)
		_gm_sender(@p, @gm, @messages['gm'])
		
		,msg(@messages['gm']['usage'])
			
	)

)