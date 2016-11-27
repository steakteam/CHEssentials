#parse messages
proc _pm(@message, @array = '') {
	if(is_array(@array)) {
		foreach(@key:@value in @array) {
			@message = replace(@message, '{'.@key.'}', @value)
		}
	}
	return(colorize(@message))
}

#version proc
proc _get_che_version() {
	return('0.1.1-DEV')
}