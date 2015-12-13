#parse messages
proc(_pm, @message, @array,
	foreach(@key:@value in @array) {
		replace(@message, '%'.@key.'%', @value)
	}
	return(colorize(@message))
)

proc(_pm, @message,
	return(colorize(@message))
)