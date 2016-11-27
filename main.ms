_load_config()
_register_commands()
bind(player_command, null, null, @e,
	@string = split('', @e[prefix])
	@prefix = to_lower(replace(@e[prefix], '/', ''))
	if(_che_has_cmd(@prefix)) {
		cancel()
		@array = split(' ', @e[command])
		array_remove(@array, 0)
		_che_run_cmd(@prefix, @array, import('chessentials.messages'), import('chessentials.config'))
	} else {
		@prefix = replace(@e[prefix], '/che', '')
		if(_che_has_cmd(@prefix)) {
			cancel()
			@array = split(' ', @e[command])
			array_remove(@array, 0)
			_che_run_cmd(@prefix, @array, import('chessentials.messages'), import('chessentials.config'))
		}
	}
)


bind(async_player_chat, null, null, @e,
	if(import('chessentials.config')[chat][radius] != '0') {
		@hearplayers = players_in_radius(ploc(@e[player]), import('chessentials.config')[chat][radius])
		foreach(@player in all_players()) {
			if(has_permission(@player, 'che.chat.superear')) {
				array_push(@hearplayers, @player)
			}
		}
		modify_event('recipients', @hearplaayers)
	}
	if(import('chessentials.config')[chat][format] != null) {
		if(has_permission('che.chat.color')) {
			@format = _chat_format_parse(import('chessentials.config')[chat][format], @e[player], colorize(@e[message]))
		} else {
			@format = _chat_format_parse(import('chessentials.config')[chat][format], @e[player], @e[message])
		}
	}
	
	if(array_size(pgroup(@e[player])) > 0 &&
			array_index_exists(import('chessentials.config')[chat], 'group-formats') &&
			array_index_exists(import('chessentials.config')[chat]['group-formats'], pgroup(@e[player])[0])) {
		@format = _chat_format_parse(import('chessentials.config')[chat]['group-formats'][pgroup(@e[player])[0]], @e[player], @e[message])
	}

)

bind(shutdown, null, null, @e,
	_save_mails()
)