proc _execute(@command, @array, @messages, @config) {
	if(array_size(@array) == 0) {
		broadcast(_pm(import('chessentials.messages')['afk.on'], array(player())))
		export(player().'.autoafktimer', 'afk')
	} else if(has_permission(player(), 'che.afk.others')) {
		if(ponline(@array[0])) {
			broadcast(_pm(import('chessentials.messages')['afk.on'], array(@array[0])))
			export(@array[0].'.autoafktimer', 'afk')
		} else {
			msg(_pm(import('chessentials.messages')['afk.wronguse.withothers'], array(@command)))
		}
	} else {
		msg(_pm(import('chessentials.messages')['afk.wronguse'], array(@command)))
	}
}

proc _has_permission() {
	return(has_permission(player(), 'che.afk'))
}

proc _command() {
	return(array('afk')) # Commands in array
} 