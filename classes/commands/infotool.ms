proc(_execute, @command, @array, @messages, @config,
	if(has_bind(player().'.infotool')) {
		unbind(player().'.infotool')
		export(player().'.infotool', 'none')
		msg(_pm(@messages['infotool.deactivated']))
	} else {
		export(player().'.infotool', pinv(player(), null))
		bind(player_interact, array(id: player().'.infotool'), null, @e, @messages,
			if(pinv(player(), null) == import(player().'.infotool') && @e[block] != '0') {
				msg(_pm(@messages['infotool.clicked'], array(@e[block])))
				cancel()
			}
		)
		msg(_pm(@messages['infotool.activated'], array(pinv(player(), null)[type].':'.pinv(player(), null)[data])))
	}
)

proc(_has_permission,
return(has_permission(player(), 'che.command.xxx'))
)