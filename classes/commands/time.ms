#time

proc(_execute, @command, @array, @messages, @config,
	if(array_size(@array) == 0 || array_size(@array) >= 3){
		msg(_pm(@messages['time.wronguse'], array(@command)));
	}
	if(array_size(@array) == 1){
		try( @time = integer(@array[0]) , @e , @time = _istime(@array[0]) , array(CastException) )
		if(!@time){ msg(_pm(@messages['time.wronguse'], array(@command))); exit(); }
		set_ptime(@time)
		msg(_pm(@messages['time.settime'], array(@time)));
	}
	if(array_size(@array) == 2){
		if(equals_ic(@array[0], 'set')){
		try( @time = integer(@array[1]) , @e , @time = _istime(@array[0]);, array(CastException) )
		if(!@time){ msg(_pm(@messages['time.wronguse'], array(@command))); exit(); }
		set_ptime(@time)
		msg(_pm(@messages['time.settime'], array(@time)));
		}else if(equals_ic(@array[0], 'add')){
		try( @time2 = integer(@array[1]) , @e , broadcast(c);msg(_pm(@messages['time.wronguse'], array(@command))); exit(); , array(CastException) )
		@ctime = pget_time()
		@time = (add(@ctime, @time2) % 24000)
		set_ptime(@time)
		msg(_pm(@messages['time.settime'], array(@time)));
		}else{ msg(_pm(@messages['time.wronguse'], array(@command))); }
	}
)

proc(_has_permission,
return(has_permission(player(), 'che.command.time'))
)

proc(_istime, @time,

# morning = 0
# day = 2000
# midday = 6000
# noon = 6000
# afternoon = 8000
# evening = 12000
# sunset = 13000
# dusk = 13500
# night = 14000
# midnight = 18000
# earlymorning = 20000
# dawn = 22500
# sunrise = 23000

if(equals_ic(@time, 'morning')){ return(0) }
if(equals_ic(@time, 'day')){ return(2000) }
if(equals_ic(@time, 'noon') || equals_ic(@time, 'midday')){ return(6000) }
if(equals_ic(@time, 'afternoon')){ return(8000) }
if(equals_ic(@time, 'evening')){ return(12000) }
if(equals_ic(@time, 'sunset')){ return(13000) }
if(equals_ic(@time, 'dusk')){ return(13500) }
if(equals_ic(@time, 'night')){ return(14000) }
if(equals_ic(@time, 'midnight')){ return(18000) }
if(equals_ic(@time, 'earlymorning')){ return(20000) }
if(equals_ic(@time, 'dawn')){ return(22500) }
if(equals_ic(@time, 'sunrise')){ return(23000) }
return(false)

)
