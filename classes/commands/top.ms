proc(_execute, @command, @array, @messages, @config,
	@topLoc = _get_top(ploc(player()));
    if(@topLoc != null){
        set_ploc(@topLoc);
		msg(_pm(@messages['top.gototop']))
    }else{
        msg(_pm(@messages['top.notop']))
    }
)

proc(_has_permission,
return(has_permission(player(), 'che.command.top'))
)

proc(_get_top, @loc,
    @clone = array_deep_clone(@loc);
    @y = @clone['y'];
    @height = world_info(@loc['world'])['maxheight'];
    for(@i = @height, @i > @y, @i--){
        @clone[1] = @i;
        @clone['y'] = @i;
        @block = get_block_at(@clone);
        if(!_is_passable_block(@block)){
            return(@clone);
        }
    }
    return(null);
)

proc(_is_passable_block, @id,
@type = array('38', '6', '31', '30', '78', '106', '65', '175', 0)
if(array_contains(@type, split(':', @id)[0])) {
	return(true)
} else {
	return(false)
}
)

proc(_command, return(array('top')))