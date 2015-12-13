proc(_gm_check, @array, @modes,

	foreach(@key: @mode in @modes){

		if(array_index_exists(@array, 0) && (equals_ic(@array[0], @mode) || equals(@array[0], @key))
		
			,return(@mode)
		
		)
		
	}
	
	return(false)

)

proc(_gm_sender, @player, @mode, @msg_gm,

	msg(colorize('&4' .@player @msg_gm['to'] @msg_gm[@mode] @msg_gm['mode_apply']))

)