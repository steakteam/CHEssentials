proc(_execute, @command, @array, @messages, @config,

	if(array_size(@array) == 3){
	
		try(
			set_ploc(player(), array(@array[0], @array[1], @array[2]))
			msg(colorize(@messages['teleporting']))
			,
			msg(_pm(@messages['tppos.wronguse'], array(@command)))
		)
	
	}else{
	
		die(_pm(@messages['tppos.wronguse'], array(@command)))
	
	}

)

proc(_has_permission,
return(has_permission(player(), 'che.command.tppos'))
)