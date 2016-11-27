proc _execute(@command, @array, @messages, @config) {
	@cursor = null
	try(@cursor = pcursor())
	if(!is_array(@cursor)) {
		msg(_pm(@messages['break.nosight']))
	} else {
		if(get_block_at(@cursor) == '7:0') {
			if(has_permission(player(), 'che.command.break.bedrock')) {
				set_block_at(@cursor, 0)
				msg(_pm(@messages['break.sucess']))
			} else {
				msg(_pm(@messages['break.nobedrock']))
			}
		} else if(get_block_at(@cursor) == '0:0') {
			msg(_pm(@messages['break.nosight']))
		} else {
			set_block_at(@cursor, 0)
			msg(_pm(@messages['break.sucess']))
		}
	}
}

proc _has_permission() {
	return(has_permission(player(), 'che.command.break'))
}

proc _command() {
	return(array('break')) # Commands in array
} 