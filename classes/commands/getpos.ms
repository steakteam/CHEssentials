proc _execute(@command, @array, @messages, @config) {
	
	if(array_size(@array) == 0){
		@p = player();
		@loc = array(integer(ploc(@p)[0]), integer(ploc(@p)[1]), integer(ploc(@p)[2]), 'world':ploc(@p)[world])
		die(_pm(@messages['getpos.printmsg'], array(@p, @loc[0], @loc[1], @loc[2], @loc[world])));
	}
	if(array_size(@array) == 1){
		@p = @array[0]
		if(!ponline(@p)){ msg(_pm(@messages['noonline'])); die(_pm(@messages['getpos.wronguse'], array(@command))); }
		@loc = array(integer(ploc(@p)[0]), integer(ploc(@p)[1]), integer(ploc(@p)[2]), 'world':ploc(@p)[world])
		die(_pm(@messages['getpos.printmsg'], array(@p, @loc[0], @loc[1], @loc[2], @loc[world])));
	}

}

proc _has_permission() {
	return(has_permission(player(), 'che.command.getpos'))
}

proc _command() {
	return(array('getpos'))
}
