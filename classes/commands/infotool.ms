proc _execute(@command, @array, @messages, @config) {
	if(import(player().'.infotool') != null) {
		export(player().'.infotool', null)
		msg(_pm(@messages['infotool.deactivated']))
	} else {
		if(is_null(pinv(player(), null))){ die(_pm(@messages['infotool.noheld'])) }
		export(player().'.infotool', pinv(player(), null))
		msg(_pm(@messages['infotool.activated'], array(pinv(player(), null)[type].':'.pinv(player(), null)[data])))
	}
}

proc _has_permission() {
return(has_permission(player(), 'che.command.infotool'))
}

proc _command() {
	return(array('infotool'))
}
