proc(_chat_format_load,
return('<player> : <message>')
)

proc(_chat_length_load,
return('-1')
)

proc(_chat_format_parse, @format, @player, @message,
@format = replace(@format, '<player>', '%1$s')
@format = replace(@format, '<message>', '%2$s')
return(@format)
)