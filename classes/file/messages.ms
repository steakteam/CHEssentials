proc(_messages_load,
#default
@array = array()
@gm = array()
@heal = array()
@feed = array()
#gm
@gm['usage'] = '플레이어의 게임모드를 변경할 수 있습니다.\n/gm <0|1|2|3|survival|creative|adventure|spectator> [플레이어]'
@gm['to'] = '&6에게'
@gm['mode_apply'] = '&6모드를 적용합니다.'
@gm['survival'] = '&c서바이벌'
@gm['creative'] = '&c크리에이티브'
@gm['adventure'] = '&c모험'
@gm['spectator'] = '&c구경꾼'
@gm['modes'] = array('survival', 'creative', 'adventure', 'spectator')
#heal
@heal['heal'] = '&6당신은 회복되었습니다.'
@heal['heal_to'] = '&f님이 회복되었습니다.'
#feed
@feed['feed_to'] = '&f의 배고픔을 모두 채웠습니다.'
#array
@array['gm'] = @gm
@array['heal'] = @heal
@array['feed'] = @feed
#other
@array['error_prefix'] = '&c오류:'
@array['test'] = '테스트에유'
@array['error_cant_find_player'] = '&4플레이어를 찾을 수 없습니다.'
@array['player'] = '&6플레이어'
@array['enable'] = '&c활성화'
@array['disable'] = '&c비활성화'
@array['do'] = '&6시켰습니다.'
#return
return(@array)
)