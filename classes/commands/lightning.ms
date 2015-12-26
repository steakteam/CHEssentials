proc(_execute, @command, @array, @messages, @config,

	if(array_size(@array) == 0){
		@loc = pcursor(player(), array(0))
		lightning(@loc)
		die(_pm(@messages['lightning.smite'], array(@loc[0], @loc[1], @loc[2])))
	}else if(array_size(@array) == 1){
		@p = @array[0]
		if(!ponline(@p)){ msg(_pm(@messages['noonline'])); die(_pm(@messages['lightning.wronguse'], array(@command)));}
		@loc = array(integer(ploc(@p)[0]), integer(ploc(@p)[1]), integer(ploc(@p)[2]), 'world':ploc(@p)[world])
		lightning(@loc)
		die(_pm(@messages['lightning.smite'], array(@loc[0], @loc[1], @loc[2])))
	}else{ 
		die(_pm(@messages['lightning.wronguse'], array(@command)))
	}
)

proc(_has_permission,
return(has_permission(player(), 'che.command.lightning'))
)
