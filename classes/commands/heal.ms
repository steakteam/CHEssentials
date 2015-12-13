proc(_execute, @command, @array, @messages, @config,
set_phealth(get_max_health(entity_id(pinfo(player(), 13))))
set_phunger(20)
)

proc(_has_permission,
return(has_permission(player(), 'che.command.heal'))
)