proc _bind_events() {
	_bind_infotool_event()
}

proc _bind_infotool_event() {
	bind(player_interact, null, null, @e,
		if(import(@e[player].'.infotool') != null && pinv(@e[player], null) == import(@e[player].'.infotool') && @e[block] != '0') {
			msg(_pm(import('chessentials.messages')['infotool.clicked'], array(@e[block])))
			cancel()
		}
	)
}