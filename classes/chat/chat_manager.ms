proc _chat_format_parse(@format, @player, @message) {
	@format = replace(@format, '{DISPLAYNAME}', '%1$s')
	@format = replace(@format, '{MESSAGE}', '%2$s')
	if(array_size(pgroup(@player)) > 0) {
		@format = replace(@format, '{GROUP}', pgroup(@player)[0])
	}
	@format = replace(@format, '{WORLDNAME}', pworld(@player))
	@format = replace(@format, '{SHORTWORLDNAME}', substr(pworld(@player), 0, 1))
	return(@format)
}

proc _bind_chat_formatter() {
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
}