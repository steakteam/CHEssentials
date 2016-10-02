proc(_execute, @command, @array, @messages, @config,
    pkill(player());
    msg(_pm(@messages['suicided']));
)

proc(_has_permission,
return(has_permission(player(), 'che.command.suicide'))
)

proc(_command, return(array('suicide'))) # Commands in array