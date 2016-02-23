include('classes/command_executor.ms')
include('classes/chat/chat_manager.ms')
include('classes/file/config.ms')
include('classes/file/messages.ms')
export('messages', _messages_load())
export('config', _config_load())
export('chat.format', _chat_format_load())
export('chat.length', _chat_length_load())
bind(player_command, null, null, @e,
	@string = split('', @e[prefix])
	if(equals_ic(@string[1], 'c') && equals_ic(@string[2], 'h') && equals_ic(@string[3], 'e')){
	@prefix = replace(@e[prefix], '/che', '')
	}else{
	@prefix = replace(@e[prefix], '/', '')
	}
	if(_che_has_cmd(@prefix)) {
		cancel()
		@array = split(' ', @e[command])
		array_remove(@array, 0)
		_che_run_cmd(@prefix, @array, import('messages'), import('config'))
	}
)


bind(async_player_chat, null, null, @e,
	if(import('chat.format') != null) {
		if(has_permission('che.chat.color')) {
			modify_event('format', _chat_format_parse(import('chat.format'), @e[player], colorize(@e[message])))
		} else {
			modify_event('format', _chat_format_parse(import('chat.format'), @e[player], @e[message]))
		}
	}
	if(import('chat.length') != '-1') {
		@hearplayers = players_in_radius(ploc(@e[player]), import('chat.length'))
		foreach(@player in all_players()) {
			if(has_permission(@player, 'che.chat.superear')) {
				array_push(@hearplayers, @player)
			}
		}
		modify_event('recipients', @hearplaayers)
	}

)
