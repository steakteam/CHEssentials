proc(_execute, @command, @array, @messages, @config,
	@loc = ploc(player())
	@y = @loc[y]
	for(@i=255,@i > @y,@i--) {
		array_set(@loc, 1, @i)
		array_set(@loc, y, @i)
		@block = get_block_at(@loc)
		if(!_is_passable_block(@block)) {
			set_ploc(@loc)
			msg(_pm(@messages['top.gototop']))
			return()
		}
	}
	msg(_pm(@messages['top.notop']))
)

proc(_has_permission,
return(has_permission(player(), 'che.command.top'))
)

proc(_is_passable_block, @id,
@type = array('38', '6', '31', '30', '78', '106', '65', '175', 0)
if(array_contains(@type, split(':', @id)[0])) {
	return(true)
} else {
	return(false)
}
)