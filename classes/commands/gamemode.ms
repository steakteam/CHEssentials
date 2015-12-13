proc(_execute, @command, @array, @messages, @config,
	if(array_size(@array) == 0) {
		if(pmode(player()) == 'SURVIVAL') {
			set_pmode(player(), 'CREATIVE')
			msg(_pm(@messages[gmchange], array(player(), 'CREATIVE')))
		} else if(pmode(player()) == 'CREATIVE') {
			set_pmode(player(), 'ADVENTURE')
			msg(_pm(@messages[gmchange], array(player(), 'ADVENTURE')))
		} else if(pmode(player()) == 'ADVENTURE') {
			set_pmode(player(), 'SPECTATOR')
			msg(_pm(@messages[gmchange], array(player(), 'SPECTATOR')))
		} else if(pmode(player()) == 'SPECTATOR') {
			set_pmode(player(), 'SURVIVAL')
			msg(_pm(@messages[gmchange], array(player(), 'SURVIVAL')))
		} else {
			msg(_pm(@messages['wronguse.gamemode'], @command))
		}
	} else if(array_size(@array) == 1) {
		if(@array[0] == 0 || to_upper(@array[0]) == 'SURVIVAL' || to_upper(@array[0]) == 'S') {
			set_pmode(player(), 'SURVIVAL')
			msg(_pm(@messages[gmchange], array(player(), 'SURVIVAL')))
		} else if(@array[0] == 1 || to_upper(@array[0]) == 'CREATIVE' || to_upper(@array[0]) == 'C') {
			set_pmode(player(), 'CREATIVE')
			msg(_pm(@messages[gmchange], array(player(), 'CREATIVE')))
		} else if(@array[0] == 2 || to_upper(@array[0]) == 'ADVENTURE' || to_upper(@array[0]) == 'A') {
			set_pmode(player(), 'ADVENTURE')
			msg(_pm(@messages[gmchange], array(player(), 'ADVENTURE')))
		} else if(@array[0] == 3 || to_upper(@array[0]) == 'SPECTATOR' || to_upper(@array[0]) == 'SP') {
			set_pmode(player(), 'SPECTATOR')
			msg(_pm(@messages[gmchange], array(player(), 'SPECTATOR')))
		} else {
			msg(_pm(@messages['wronguse.gamemode'], @command))
		}
	} else if(array_size(@array) == 2) {
		if(ponline(@array[1])) {
			if(@array[0] == 0 || to_upper(@array[0]) == 'SURVIVAL' || to_upper(@array[0]) == 'S') {
				set_pmode(player(), 'SURVIVAL')
				msg(_pm(@messages[gmchange], array(player(), 'SURVIVAL')))
			} else if(@array[0] == 1 || to_upper(@array[0]) == 'CREATIVE' || to_upper(@array[0]) == 'C') {
				set_pmode(player(), 'CREATIVE')
				msg(_pm(@messages[gmchange], array(player(), 'CREATIVE')))
			} else if(@array[0] == 2 || to_upper(@array[0]) == 'ADVENTURE' || to_upper(@array[0]) == 'A') {
				set_pmode(player(), 'ADVENTURE')
				msg(_pm(@messages[gmchange], array(player(), 'ADVENTURE')))
			} else if(@array[0] == 3 || to_upper(@array[0]) == 'SPECTATOR' || to_upper(@array[0]) == 'SP') {
				set_pmode(player(), 'SPECTATOR')
				msg(_pm(@messages[gmchange], array(player(), 'SPECTATOR')))
			} else {
				msg(_pm(@messages['wronguse.gamemode'], @command))
			}
		} else {
			msg(_pm(@messages['wronguse.gamemode'], @command))
		}
	} else {
		msg(colorize(@messages['wronguse.gamemode']))
	}
)

proc(_has_permission,
return(has_permission(player(), 'che.command.gamemode'))
)