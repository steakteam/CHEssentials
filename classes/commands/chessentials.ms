proc _execute(@command, @array, @messages, @config) {
	if(array_size(@array) == 1) {
		if(@array[0] == 'reload') {
			_load_config()
			msg(_pm(@messages['chessentials.reloaded'], array(_get_che_version())))
		} else {
			msg(_pm(@messages['chessentials.usage'], array(@command)))
		}
	} else {
		msg(_pm(@messages['chessentials.usage'], array(@command)))
	}
}

proc _has_permission() {
return(has_permission(player(), 'che.command.chessentials'))
}

proc _command() {
	return(array('che', 'chessentials'))) # Commands in array
}