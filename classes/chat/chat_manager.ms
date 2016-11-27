proc _chat_format_parse(@format, @player, @message) {
	@format = replace(@format, '{DISPLAYNAME}', '%1$s')
	@format = replace(@format, '{MESSAGE}', '%2$s')
	if(array_size(pgroup(@player)) > 0) {
		@format = replace(@format, '{GROUP}', pgroup(@player)[0])
	}
	@format = replace(@format, '{WORLDNAME}', pworld(@player))
	@format = replace(@format, '{SHORTWORLDNAME}', substr(pworld(@player), 0, 1))
	return(@format)
}