proc(_execute, @command, @array, @messages, @config,

	if(array_size(@array) <= 1){
		die(_pm(@messages['tell.wronguse'], array(@command)));
	}else{
		@p = player()
		@targetp = @array[0]
		if(!ponline(@targetp)){ msg(_pm(@messages['noonline'])); die(_pm(@messages['tell.wronguse'], array(@command))); }
		array_remove(@array, 0)
		@as = array_size(@array)
		@format1 = @config['outtell']
		@format2 = @config['receivetell']
		
		@message = '';
		
		for(assign(@di, 0), @di < @as, @di++){
			@message = sconcat(@message, @array[@di])
		}
		
		@smsg = replace(replace(replace(replace(@format1, '<me>', @p), '<targetplayer>', @targetp), '<message>', @message), '&', '§')
		@tmsg = replace(replace(replace(replace(@format2, '<me>', @p), '<targetplayer>', @targetp), '<message>', @message), '&', '§')
		
		msg(@smsg)
		tmsg(@targetp, @tmsg)
		
		export(@targetp.'.lastsender', @p)
	}

)

proc(_has_permission,
return(has_permission(player(), 'che.command.tell'))
)
