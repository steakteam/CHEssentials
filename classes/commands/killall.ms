proc(_execute, @command, @array, @messages, @config,
if(array_size(@array) == 0){ @world = pworld() }
if(array_size(@array) == 1){ @world = @array[0] }
if(array_size(@array) >= 2){ die(_pm(@messages['killall.help'], array(@command))) }
@entities = 0;
foreach(@chunk in get_loaded_chunks(@world)){
@x = @chunk[x]; @z = @chunk[z];
@entity = all_entities(@chunk[world], @x, @z)
if(!array_index_exists(@entity, 0)){ refresh_chunk(@chunk[world], @x, @z); continue(); }
foreach(@uuid in @entity){
@type = entity_type(@uuid)
if(equals_ic(@type, 'player') || get_mob_name(@uuid) != ''){ continue(); }
entity_remove(@uuid)
refresh_chunk(@chunk[world], @x, @z);
@entities++;
}
}
msg(_pm(@messages['killall.complete'], array(@entities)));
)

proc(_has_permission,
return(has_permission(player(), 'che.command.killall'))
)
