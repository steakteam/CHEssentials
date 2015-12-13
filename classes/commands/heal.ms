proc(_execute, @command, @array, @messages, @config,
	if(array_size(@array) == 0) {
		set_phealth(get_max_health(entity_id(pinfo(player(), 13))))
		set_phunger(20)
		msg(_pm(@messages[healed], player()))
	} else if(array_size(@array) == 1) {
		if(ponline(@array[0])) {
			set_phealth(get_max_health(entity_id(pinfo(player(), 13))))
			set_phunger(20)
			msg(_pm(@messages[healed], @array[0]))
		} else {
			msg(colorize(@messages[noonline]))
		}
	} else {
		msg(_pm(@messages['wronguse.heal'], @command))
	}
)

proc(_has_permission,
	return(has_permission(player(), 'che.command.heal'))
)