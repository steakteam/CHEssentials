proc _execute(@command, @array, @messages, @config) {

	if(array_size(@array) == 0 || array_size(@array) >= 3){
		die(_pm(@messages['sky.wronguse'], array(@command)));
	}
	if(array_size(@array) == 1){
		@weather = @array[0]
		if(equals_ic(@weather, 'sun')){
			set_pstorm(false)
		}else if(equals_ic(@weather, 'rain')){
			set_pstorm(true)
		}else{
			die(_pm(@messages['sky.wronguse'], array(@command))); 
		}
			die(_pm(@messages['sky.changesky'], array(@weather)));
	}
}

proc _has_permission() {
	return(has_permission(player(), 'che.command.sky'))
}

proc _command() {
	return(array('sky', 'weather'))
}
