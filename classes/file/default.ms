proc(_cmd_default_player, @array, @index,

	if(!array_index_exists(@array, @index),
		array_set(@array, @index, player()))

)

proc(_find_player, @p, @msg,

	if(!ponline(_better_player(@p))
		,msg(colorize(@msg['error_prefix'] @msg['error_cant_find_player'])))

)

proc(_better_player, @p,

	foreach(@player in all_players()){
	
		if(equals(string_position(to_lower(@player), to_lower(@p)), 0)
			,return(@player))
	
	}
	
	return(false)

)