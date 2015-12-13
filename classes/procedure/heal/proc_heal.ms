proc(_pheal, @p,

	@max = get_max_health(puuid(@p))
	set_phealth(@p, @max)
	set_phunger(@p, 20)

)

proc(_heal_sender, @p, @msg,

	msg(colorize('&4' .@p @msg['heal_to']))
	tmsg(@p, colorize(@msg['heal']))

)