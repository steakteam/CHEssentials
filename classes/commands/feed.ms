proc _execute(@command, @array, @messages, @config) {
	if(import(player().'.feedcooldown') == null || has_permission('che.command.feed.cooldown.bypass')) {
		if(array_size(@array) == 0) {
			set_phunger(20)
			msg(_pm(@messages['feed.feeded.myself']))
			if(!has_permission('che.command.feed.cooldown.bypass')) {
				export(player().'.feedcooldown', @config['feed-cooldown'])
			}
		} else if(array_size(@array) == 1) {
			if(has_permission('che.command.feed.others')) {
				if(ponline(@array[0])) {
					set_phunger(20)
					msg(_pm(@messages['feed.feeded'], array(@array[0])))
					tmsg(@array[0], _pm(@messages['feed.feeded'], array(@array[0])))
				} else {
					msg(colorize(@messages[noonline]))
				}
			} else {
				msg(_pm(@messages['feed.noperm.others']))
			}
			if(!has_permission('che.command.feed.cooldown.bypass')) {
				export(player().'.feedcooldown', @config['feed-cooldown'])
			}
		} else {
			msg(_pm(@messages['feed.wronguse'], array(@command)))
		}
	} else {
		msg(_pm(@messages['command.cooldown'], array(import(player().'.feedcooldown'))))
	}
}

proc _has_permission() {
	return(has_permission(player(), 'che.command.feed'))
}

proc _command() {
	return(array('feed', 'eat'))
}