proc _bind_events() {
	_bind_infotool_event()
	_bind_userdata_event()
	_bind_timer()
	_bind_afk_event()
}

proc _bind_infotool_event() {
	bind(player_interact, null, null, @e,
		if(import(@e[player].'.infotool') != null && pinv(@e[player], null) == import(@e[player].'.infotool') && @e[block] != '0') {
			msg(_pm(import('chessentials.messages')['infotool.clicked'], array(@e[block])))
			cancel()
		}
	)
}

proc _bind_userdata_event() {
	include('../file/userdata_handler.ms')
	bind(player_join, null, null, @e,
		@timestamps = array()
		_set_user_data(@e[player], 'lastAccountName', @e[player])
		_add_puuid(@e[player], puuid(@e[player]))
		if(_has_user_data(@e[player], 'timestamps')) {
			@timestamps = _get_user_data(@e[player], 'timestamps')
		}
		array_set(@timestamps, 'login', time())
		_set_user_data(@e[player], 'timestamps', @timestamps, true)
		_set_user_data(@e[player], 'ipAddress', pinfo(@e[player], 3))
		if(array_size(_mail_read(@e[player])) > 0) {
			msg(_pm(import('chessentials.messages')['mail.unread'], array(array_size(_mail_read(@e[player])))))
		}
	)
	
	bind(player_quit, null, null, @e,
		@timestamps = array()
		if(_has_user_data(@e[player], 'timestamps')) {
			@timestamps = _get_user_data(@e[player], 'timestamps')
		}
		array_set(@timestamps, 'logout', time())
		_set_user_data(@e[player], 'timestamps', @timestamps, true)
		_set_user_data(@e[player], 'logoutLocation', 
			array(
				'world': ploc()[world],
				'x': ploc()[x],
				'y': ploc()[y],
				'z': ploc()[z],
				'yaw': ploc()[yaw],
				'pitch': ploc()[pitch]
			)
		)
	)
}

proc _bind_timer() {
	foreach(@player in all_players()) {
		if(import('chessentials.config')['auto-afk'] != '-1') {
			export(@player.'.autoafktimer', import('chessentials.config')['auto-afk'])
		}
		if(import('chessentials.config')['auto-afk-kick'] != '-1') {
			export(@player.'.autoafkkicktimer', import('chessentials.config')['auto-afk-kick'])
		}
	}
	set_interval(1000, closure(
		foreach(@player in all_players()) {
			if(import('chessentials.config')['auto-afk'] != '-1') {
				if(is_numeric(import(@player.'.autoafktimer'))) {
					export(@player.'.autoafktimer', import(@player.'.autoafktimer') - 1)
				}
				if(import(@player.'.autoafktimer') == 0) {
					broadcast(_pm(import('chessentials.messages')['afk.on'], array(@player)))
					export(@player.'.autoafktimer', 'afk')
				}
			}
			if(import('chessentials.config')['auto-afk-kick'] != '-1') {
				if(is_numeric(import(@player.'.autoafkkicktimer'))) {
					export(@player.'.autoafkkicktimer', import(@player.'.autoafkkicktimer') - 1)
				}
				if(import(@player.'.autoafkkicktimer') == 0) {
					pkick(@player, _pm(import('chessentials.messages')['afk.kicked'], array(@player)))
				}
			}
			if(import(@player.'.feedcooldown') != null) {
				export(@player.'.feedcooldown', import(@player.'.feedcooldown') - 1)
			}
			
			if(import(@player.'.healcooldown') != null) {
				export(@player.'.healcooldown', import(@player.'.healcooldown') - 1)
			}
		}
	
	))
}

proc _bind_afk_event() {
	bind(player_join, null, null, @e,
		_afk_refresh(@e[player])
	)
	bind(player_chat, null, null, @e,
		_afk_refresh(@e[player])
	)
	bind(player_command, null, null, @e,
		_afk_refresh(@e[player])
	)
	bind(player_consume, null, null, @e,
		_afk_refresh(@e[player])
	)
	bind(player_enter_bed, null, null, @e,
		_afk_refresh(@e[player])
	)
	bind(player_fish, null, null, @e,
		_afk_refresh(@e[player])
	)
	bind(player_interact, null, null, @e,
		_afk_refresh(@e[player])
	)
	bind(player_interact_at_entity, null, null, @e,
		_afk_refresh(@e[player])
	)
	bind(player_interact_entity, null, null, @e,
		_afk_refresh(@e[player])
	)
	bind(player_move, null, null, @e,
		_afk_refresh(@e[player])
	)
	bind(player_portal_travel, null, null, @e,
		_afk_refresh(@e[player])
	)
	bind(player_spawn, null, null, @e,
		_afk_refresh(@e[player])
	)
	bind(player_teleport, null, null, @e,
		_afk_refresh(@e[player])
	)
	bind(player_toggle_flight, null, null, @e,
		_afk_refresh(@e[player])
	)
	bind(player_toggle_sneak, null, null, @e,
		_afk_refresh(@e[player])
	)
	bind(player_toggle_sprint, null, null, @e,
		_afk_refresh(@e[player])
	)
	bind(player_quit, null, null, @e,
		if(import('chessentials.config')['auto-afk'] != '-1') {
			if(import(@e[player].'.autoafktimer') == 'afk') {
				broadcast(_pm(import('chessentials.messages')['afk.off'], array(@e[player])))
			}
			export(@e[player].'.autoafktimer', null)
		}
		if(import('chessentials.config')['auto-afk-kick'] != '-1') {
			export(@e[player].'.autoafkkicktimer', null)
		}
	)
}

proc _afk_refresh(@player) {
	if(import('chessentials.config')['auto-afk'] != '-1') {
		if(import(@player.'.autoafktimer') == 'afk') {
			broadcast(_pm(import('chessentials.messages')['afk.off'], array(@e[player])))
		}
		export(@player.'.autoafktimer', import('chessentials.config')['auto-afk'])
	}
	if(import('chessentials.config')['auto-afk-kick'] != '-1') {
		export(@player.'.autoafkkicktimer', import('chessentials.config')['auto-afk-kick'])
	}
}