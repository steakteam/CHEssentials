proc(_execute, @command, @array, @messages, @config,
    @currSpawnLoc = get_spawn(pworld(player()));
    @top = _get_top(@currSpawnLoc);
    if(@top != null){
        set_ploc(@top);
    }else{
        set_ploc(@currSpawnLoc);
    }
    msg(_pm(@messages['teleporting']));
)

proc(_has_permission,
return(has_permission(player(), 'che.command.spawn'))
)

proc(_command, return(array('spawn')))