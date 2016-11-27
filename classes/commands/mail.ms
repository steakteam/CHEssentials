proc _execute(@command, @array, @messages, @config) {
	include('../file/userdata_handler.ms')
	switch(array_size(@array)){
		case 1:
			if(@array[0] == 'read'){
				@mailArray = _mail_read(player())
				@mailSize = array_size(@mailArray)
				@remainder = @mailSize % 9
				if(@mailSize > 0){
					@contents = null
					@maxPage = integer(@mailSize / 9)
					
					if(@remainder > 0){
						@maxPage += 1
					}
					
					for(@i = 0,@i < 9, @i++){
                        if(array_index_exists(@mailArray, @i)){
                            if(@contents != null
                                ,@contents = @contents . '\n' . @mailArray[@i]
                                ,@contents = @mailArray[@i])
                        }else{
                            break()
                        }
					}
					msg(_pm(@messages['mail.list'], array(1, @maxPage, @contents)))
				}else{
					msg(_pm(@messages['mail.notexist']))
				}
			}else if(@array[0] == 'clear'){
				_mail_clear(player())
                msg(_pm(@messages['mail.clear']))
			}else{
				msg(_pm(
					@messages['mail.wronguse'], 
					array(@command)
				))
			}
			break()
		case 2:
			if(@array[0] == 'sendall'){
				foreach(@player in get_offline_players()){
					_mail_send(_pm(@messages['mail.contents'], array(player(), @array[1])), @player)
				}
                msg(_pm(@messages['mail.send']))
			}else if(@array[0] == 'read'){
				@page = integer(@array[1]); //2
				@tick = @page * 9;
				@mailArray = _get_mails(player()); //{"a", "b"}
				@mailSize = array_size(@mailArray);
				@remainder = @mailSize % 9;
				@maxPage = integer(@mailSize / 9);
				@contents = null;
					
				if(@remainder > 0){
					@maxPage += 1;
				}
					
				for(@i = @tick - 9, @i < @tick, @i++){
					if(array_index_exists(@mailArray, @i)){
						if(@contents != null
							,@contents = @contents . '\n' . @mailArray[@i]
							,@contents = @mailArray[@i]);
					}else{
						break();
					}
				}
				msg(_pm(@messages['mail.list'], array(@page, @maxPage, @contents)));
			}else{
				msg(_pm(
					@messages['mail.wronguse'], 
					array(@command)
				));
			}
			break();
		case 3:
			if(@array[0] == 'send'){
				if(_mail_send(_pm(@messages['mail.contents'], array(player(), @array[2])), @array[1])) {
					msg(_pm(@messages['mail.send']))
				} else {
					msg(_pm(@messages['mail.noreciver']))
				}
                
			}else{
				msg(_pm(
					@messages['mail.wronguse'], 
					array(@command)
				));
			}
			break();
		default:
			msg(_pm(
				@messages['mail.wronguse'], 
				array(@command)
			));
	}
}

proc _has_permission() {
	return(has_permission(player(), 'che.command.mail'))
}

proc _command() {
	return(array('mail', 'email'))
}