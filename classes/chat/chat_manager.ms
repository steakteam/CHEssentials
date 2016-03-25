proc(_chat_format_parse, @format, @player, @message,
@format = replace(@format, '<player>', '%1$s')
@format = replace(@format, '<message>', '%2$s')
return(@format)
)