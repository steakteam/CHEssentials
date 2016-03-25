proc(_execute, @command, @array, @messages, @config,
	set_pflight(player(), !phas_flight(player()))
	msg(_pm(@messages['fly.toggle'], array(pinfo(player(), 4), _pm(@messages['fly.'.phas_flight(player())]))))
)

proc(_has_permission,
return(has_permission(player(), 'che.command.fly'))
)

proc(_command,
return(array('fly'))
)