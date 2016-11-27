proc _execute(@command, @array, @messages, @config) {
	if(array_size(@array) == 0) {
		if(pmode(player()) == 'SURVIVAL') {
			set_pmode(player(), 'CREATIVE')
			msg(_pm(@messages['gamemode.changed'], array(player(), 'CREATIVE')))
		} else if(pmode(player()) == 'CREATIVE') {
			set_pmode(player(), 'ADVENTURE')
			msg(_pm(@messages['gamemode.changed'], array(player(), 'ADVENTURE')))
		} else if(pmode(player()) == 'ADVENTURE') {
			set_pmode(player(), 'SPECTATOR')
			msg(_pm(@messages['gamemode.changed'], array(player(), 'SPECTATOR')))
		} else if(pmode(player()) == 'SPECTATOR') {
			set_pmode(player(), 'SURVIVAL')
			msg(_pm(@messages['gamemode.changed'], array(player(), 'SURVIVAL')))
		} else {
			msg(_pm(@messages['gamemode.wronguse'], array(@command)))
		}
	} else if(array_size(@array) == 1) {
		if(@array[0] == 0 || to_upper(@array[0]) == 'SURVIVAL' || to_upper(@array[0]) == 'S') {
			set_pmode(player(), 'SURVIVAL')
			msg(_pm(@messages['gamemode.changed'], array(player(), 'SURVIVAL')))
		} else if(@array[0] == 1 || to_upper(@array[0]) == 'CREATIVE' || to_upper(@array[0]) == 'C') {
			set_pmode(player(), 'CREATIVE')
			msg(_pm(@messages['gamemode.changed'], array(player(), 'CREATIVE')))
		} else if(@array[0] == 2 || to_upper(@array[0]) == 'ADVENTURE' || to_upper(@array[0]) == 'A') {
			set_pmode(player(), 'ADVENTURE')
			msg(_pm(@messages['gamemode.changed'], array(player(), 'ADVENTURE')))
		} else if(@array[0] == 3 || to_upper(@array[0]) == 'SPECTATOR' || to_upper(@array[0]) == 'SP') {
			set_pmode(player(), 'SPECTATOR')
			msg(_pm(@messages['gamemode.changed'], array(player(), 'SPECTATOR')))
		} else {
			msg(_pm(@messages['gamemode.wronguse'], array(@command)))
		}
	} else if(array_size(@array) == 2) {
		if(ponline(@array[1])) {
			if(@array[0] == 0 || to_upper(@array[0]) == 'SURVIVAL' || to_upper(@array[0]) == 'S') {
				set_pmode(@array[1], 'SURVIVAL')
				msg(_pm(@messages['gamemode.changed'], array(@array[1], 'SURVIVAL')))
				tmsg(@array[1], _pm(@messages['gamemode.changed'], array(@array[1], 'SURVIVAL')))
			} else if(@array[0] == 1 || to_upper(@array[0]) == 'CREATIVE' || to_upper(@array[0]) == 'C') {
				set_pmode(@array[1], 'CREATIVE')
				msg(_pm(@messages['gamemode.changed'], array(@array[1], 'CREATIVE')))
				tmsg(@array[1], _pm(@messages['gamemode.changed'], array(@array[1], 'CREATIVE')))
			} else if(@array[0] == 2 || to_upper(@array[0]) == 'ADVENTURE' || to_upper(@array[0]) == 'A') {
				set_pmode(@array[1], 'ADVENTURE')
				msg(_pm(@messages['gamemode.changed'], array(@array[1], 'ADVENTURE')))
				msg(@array[1], _pm(@messages['gamemode.changed'], array(@array[1], 'ADVENTURE')))
			} else if(@array[0] == 3 || to_upper(@array[0]) == 'SPECTATOR' || to_upper(@array[0]) == 'SP') {
				set_pmode(@array[1], 'SPECTATOR')
				msg(_pm(@messages['gamemode.changed'], array(@array[1], 'SPECTATOR')))
				tmsg(@array[1], _pm(@messages['gamemode.changed'], array(@array[1], 'SPECTATOR')))
			} else {
				msg(_pm(@messages['gamemode.wronguse'], array(@command)))
			}
		} else {
			msg(_pm(@messages['gamemode.wronguse'], array(@command)))
		}
	} else {
		msg(colorize(@messages['gamemode.wronguse'], array(@command)))
	}
}

proc _has_permission() {
	return(has_permission(player(), 'che.command.gamemode'))
}

proc _command() {
	return(array('gamemode', 'gm'))
}