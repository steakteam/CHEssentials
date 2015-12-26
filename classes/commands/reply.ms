proc(_execute, @command, @array, @messages, @config,

	if(array_size(@array) == 0){
		die(_pm(@messages['reply.wronguse'], array(@command)));
	}
	if(array_size(@array) >= 1){
	
	@p = player();
	if(is_null(import(@p.'.lastsender'))){ die(_pm(@messages['reply.noplayer'], array())); }
	@targetp = player(import(@p.'.lastsender'))
	if(!ponline(@targetp)){ msg(_pm(@message['noonline'])); die(_pm(@messages['reply.wronguse'], array(@command))); }
	
	@as = array_size(@array)
	@format1 = @config['outtell']
	@format2 = @config['receivetell']
	
	@message = '';
	
	for(assign(@di, 0), @di < @as, @di++){
		@message = sconcat(@message, @array[@di])
	}
	
	@smsg = replace(replace(replace(@format1, '<me>', @p), '<targetplayer>', @targetp), '<message>', @message)
	@tmsg = replace(replace(replace(@format2, '<me>', @p), '<targetplayer>', @targetp), '<message>', @message)
	
	msg(@smsg)
	tmsg(@targetp, @tmsg)
		
	export(@targetp.'.lastsender', @p)
	
	
	}
)

proc(_has_permission,
return(has_permission(player(), 'che.command.reply'))
)
