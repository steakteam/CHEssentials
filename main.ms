include('classes/command_executor.ms')
include('classes/chat/chat_manager.ms')
include('classes/file/file_handler.ms')


_load_config()
_register_commands()
bind(player_command, null, null, @e,
	@string = split('', @e[prefix])
	@prefix = replace(@e[prefix], '/', '')
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
	if(import('chessentials.chat.format') != null) {
		if(has_permission('che.chat.color')) {
			modify_event('format', _chat_format_parse(import('chessentials.chat.format'), @e[player], colorize(@e[message])))
		} else {
			modify_event('format', _chat_format_parse(import('chessentials.chat.format'), @e[player], @e[message]))
		}
	}
	if(import('chessentials.chat.length') != '-1') {
		@hearplayers = players_in_radius(ploc(@e[player]), import('chessentials.chat.length'))
		foreach(@player in all_players()) {
			if(has_permission(@player, 'che.chat.superear')) {
				array_push(@hearplayers, @player)
			}
		}
		modify_event('recipients', @hearplaayers)
	}

)
