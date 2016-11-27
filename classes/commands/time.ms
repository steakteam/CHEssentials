#time

proc _execute(@command, @array, @messages, @config) {
	if(array_size(@array) == 0 || array_size(@array) >= 3){
		die(_pm(@messages['time.wronguse'], array(@command)));
	}
	if(array_size(@array) == 1){
	
		try( @time = integer(@array[0]) , @e , @time = _is_time(@array[0]) , array(CastException) )
		if(!@time){ die(_pm(@messages['time.wronguse'], array(@command)));}
		set_ptime(@time)
		die(_pm(@messages['time.settime'], array(@time)));
		
	}
	if(array_size(@array) == 2){
	
		if(equals_ic(@array[0], 'set')){
		
		try( @time = integer(@array[1]) , @e , @time = _is_time(@array[0]);, array(CastException) )
		if(!@time){ die(_pm(@messages['time.wronguse'], array(@command))); }
		set_ptime(@time)
		die(_pm(@messages['time.settime'], array(@time)));
		
		}else if(equals_ic(@array[0], 'add')){
		
		try( @time2 = integer(@array[1]) , @e , die(_pm(@messages['time.wronguse'], array(@command))); , array(CastException) )
		@ctime = pget_time()
		@time = (add(@ctime, @time2) % 24000)
		set_ptime(@time)
		die(_pm(@messages['time.settime'], array(@time)));
		
		}else{ die(_pm(@messages['time.wronguse'], array(@command))); }
	}
}

proc _has_permission() {
	return(has_permission(player(), 'che.command.time'))
}

proc _is_time(@time) {
	@times = array('morning': 0, 'day': 2000, 'noon': 6000, 'midday': 6000, 'afternoon': 8000, 'evening': 12000, 'sunset': 13000,
		'dusk': 13500, 'night': 14000, 'midnight': 18000, 'earlymorning': 20000, 'dawn': 22500, 'sunrise': 23000)
	if(array_index_exists(@times, @time),
		return(@times[@time]),
		return(false)
	)
}

proc _command() {
	return(array('time'))
}
