proc _execute(@command, @array, @messages, @config) {
	spawn_entity('PRIMED_TNT', 1, pcursor())
}

proc _has_permission() {
	return(has_permission(player(), 'che.command.antioch'))
}

proc _command() {
	return(array('antioch')) # Commands in array
} 