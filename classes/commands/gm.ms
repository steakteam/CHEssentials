proc(_execute, @array, @messages, @config,

	_cmd_default_player(@array, 1)
		
	assign(@gm, _gm_check(@array, @messages['gm']['modes']))
	
	_find_player(@array[1], @messages)
	
	if(@gm,

		.set_pmode(_better_player(@array[1]), @gm)
		_gm_sender(_better_player(@array[1]), @gm, @messages['gm'])
		
		,msg(@messages['gm']['usage'])
			
	)

)