proc(_execute, @command, @array, @messages, @config,
	
	if(array_size(@array) == 0){
		die(_pm(@messages['kick.wronguse'], array(@command)));
	}
	
	if(array_size(@array) == 1){
	
		@p = @array[0]
		if(!ponline(@p)){ msg(_pm(@messages['noonline'])); die(_pm(@messages['kick.wronguse'], array(@command))); }
		pkick(@p, _pm(replace(@messages['kick.defaultmsg'], '&', '§')))
		die(_pm(@messages['kick.sucmsg'], array(@p)));
		
	}
	
	if(array_size(@array) >= 2){
	
		@p = @array[0]
		if(!ponline(@p)){ msg(_pm(@messages['noonline'])); die(_pm(@messages['kick.wronguse'], array(@command))); }
		
		array_remove(@array, 0)
		@as = array_size(@array)
		@msg = '';
		
		for(assign(@di, 0), @di < @as, @di++){
			@msg = sconcat(@msg, @array[@di])
		}
		
		pkick(@p, replace(@msg, '&', '§'))
		die(_pm(@message['kick.sucmsg'], array(@p)));
	
	}

)

proc(_has_permission,
return(has_permission(player(), 'che.command.kick'))
)
