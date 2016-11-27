proc _execute(@command, @array, @messages, @config) {
	if(import(player().'.feedcooldown') == null || has_permission('che.command.feed.cooldown.bypass')) {
		if(array_size(@array) == 0) {
			set_phealth(get_max_health(entity_id(pinfo(player(), 13))))
			set_phunger(20)
			msg(_pm(@messages['heal.healed.myself']))
			if(!has_permission('che.command.heal.cooldown.bypass')) {
				export(player().'.healcooldown', @config['heal-cooldown'])
			}
		} else if(array_size(@array) == 1) {
			if(has_permission('che.command.heal.others')) {
				if(ponline(@array[0])) {
					set_phealth(get_max_health(entity_id(pinfo(player(), 13))))
					set_phunger(20)
					msg(_pm(@messages['heal.healed'], array(@array[0])))
					tmsg(@array[0], _pm(@messages['heal.healed'], array(@array[0])))
				} else {
					msg(colorize(@messages[noonline]))
				}
				if(!has_permission('che.command.heal.cooldown.bypass')) {
					export(player().'.healcooldown', @config['heal-cooldown'])
				}
			} else {
				msg(_pm(@messages['heal.noperm.others']))
			}
		} else {
			msg(_pm(@messages['heal.wronguse'], array(@command)))
		}
	} else {
		msg(_pm(@messages['command.cooldown'], array(import(player().'.healcooldown'))))
	}
}

proc _has_permission() {
	return(has_permission(player(), 'che.command.heal'))
}

proc _command() {
	return(array('heal'))
}