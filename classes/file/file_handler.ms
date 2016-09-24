proc(_write_file_in_folder, @filename, @string,
	if(!file_exists('../../../../CHEssentials/') || !is_dir('../../../../CHEssentials/')) {
		create_dir('../../../../CHEssentials/')
	}
	if(!file_exists('../../../../CHEssentials/'.@filename) || !is_file('../../../../CHEssentials/'.@filename)) {
		create_file('../../../../CHEssentials/'.@filename)
	}
	write_file('../../../../CHEssentials/'.@filename, @string, 'OVERWRITE')
)

proc(_read_file_in_folder, @filename,
	if(!file_exists('../../../../CHEssentials/') || !is_dir('../../../../CHEssentials/')) {
		create_dir('../../../../CHEssentials/')
	}
	if(!file_exists('../../../../CHEssentials/'.@filename) || !is_file('../../../../CHEssentials/'.@filename)) {
		create_file('../../../../CHEssentials/'.@filename)
	}
	return(read('../../../../CHEssentials/'.@filename))
)

proc(_create_file_test, @file,
	create_file(@file)
)

proc(_file_exists_test, @file,
	msg(file_exists(@file))
)

proc(_read_config,
	@yml = _read_file_in_folder('config.yml')
	return(yml_decode(@yml))
)

proc(_read_messages,
	@yml = _read_file_in_folder('messages.yml')
	return(yml_decode(@yml))
)

proc(_read_mails,
	@json = _read_file_in_folder('mails.json')
	return(json_decode(@json))
)

proc(_write_config, @configArray,
	_write_file_in_folder('config.yml', yml_encode(@configArray, true))
)

proc(_write_messages, @messageArray,
	_write_file_in_folder('messages.yml', yml_encode(@messageArray, true))
)

proc(_write_mails, @mailArray,
	_write_file_in_folder('mails.json', json_encode(@mailArray))
)

proc(_has_config,
	return(file_exists('../../../../CHEssentials/config.yml'))
)

proc(_has_messages,
	return(file_exists('../../../../CHEssentials/messages.yml'))
)

proc(_has_mails,
	return(file_exists('../../../../CHEssentials/mails.json'))
)

proc(_make_default_config,
	_write_config(_get_default_config())
)

proc(_get_default_config,
	return(
		array(
			'chat':array('format': '<player> : <message>', 'length':'-1'),
			'outtell':('§6[§f <me> → <targetplayer> §6]§f<message>'),
			'receivetell':('§6[§f <targetplayer> ← <me> §6]§f<message>')
		)
	)
)

proc(_make_default_messages,
	_write_messages(_get_default_messages())
)

proc(_make_default_mails,
	_write_mails(_get_default_mails())
)

proc(_get_default_messages,
	return(
		array(
			'wronguse': '&c사용법: %0%',
			'noperm': '&c이것을 실행할 권한이 없습니다!',
			'teleporting': '&6텔레포트 중 입니다..',
			'gamemode.changed':'&c%0% &6님의 게임 모드가 &c%1% &6으로 변경되었습니다.',
			'noonline': '&c그 플레이어는 온라인이 아닙니다!',
			'gamemode.wronguse': '&c사용법:/%0% [게임모드] [플레이어]',
			'heal.wronguse': '&c사용법:/%0% [플레이어]',
			'heal.healed': '&c%0% &6님이 회복되었습니다.',
			'top.gototop': '&6최상층으로 이동하였습니다.',
			'top.notop': '&c더이상 위로 올라갈 수 없습니다!',
			'infotool.clicked': '&6당신이 클릭한 블록은 &c%0% &6입니다.\n&6이 도구의 사용을 중지하려면 &c/infotool &6을 다시 입력하세요.',
			'infotool.activated': '&cinfotool&6이 아이템 &c%0% &6에 등록되었습니다. 사용을 중지하시려면 &c/infotool &6을 한번 더 입력해 주세요.',
			'infotool.deactivated': '&cinfotool&6이 꺼졌습니다. 다시 사용하시려면 &c/infotool &6을 한번 더 입력해 주세요.',
			'infotool.noheld': '&cinfotool 를 사용하기 위해서는 손에 무언가를 들고 있어야 합니다.',
			'time.wronguse': '&c사용법:/%0% [시간] or /%0% [Set | Add] [시간]',
			'time.settime': '&6시간이 %0% 으로 설정되었습니다.',
			'sky.wronguse': '&c사용법:/%0% [sun|rain]',
			'sky.changesky': '&6날씨가 %0% 으로 바뀌었습니다.',
			'lightning.wronguse': '&c사용법:/%0% (플레이어)',
			'lightning.smite': '&6번개가 %0%, %1%, %2% 에 떨어졌습니다.',
			'kick.wronguse': '&c사용법:/%0% [플레이어]',
			'kick.defaultmsg': '&c당신은 킥 되셨습니다.',
			'kick.sucmsg': '당신은 %0% 님을 킥하셨습니다.',
			'getpos.wronguse': '&c사용법:/%0% (플레이어)',
			'getpos.printmsg': '&6%0% 님의 위치는 &a( %1%, %2%, %3%, %4% )&6 입니다.',
			'tell.wronguse': '&c사용법:/%0% [플레이어] [할말]',
			'tell.sameperson': '&c자신에게는 메세지를 보낼 수 없습니다.',
			'reply.wronguse': '&c사용법:/%0% [할말]',
			'reply.noplayer': '&c답장을 보낼 상대가 없습니다.',
			'killall.help': '&c사용법:/%0% [월드]',
			'killall.complete': '&d%0% 마리의 엔티티들이 제거되었습니다.',
			'tppos.wronguse': '&c사용법: /%0% (x) (y) (z)',
			'fly.toggle': '&6플레이어 &f%0% &6의 비행 모드를 %1% &6시켰습니다.',
			'fly.true': '&c활성화',
			'fly.false': '&c비활성화',
			'chessentials.usage': '&c사용법: /%0% <reload>',
			'chessentials.reloaded': '&6CHEssentials 버전 %0% 리로드됨.',
			'chessentials.version': '0.1-SNAPSHOT',
			'mail.list': ' &e---- &6메일: 읽기 &e-- &6페이지 &c%0%&6/&c%1% &e----\n&f%2%\n&6메일을 지우시려면 &c/mail clear &6를 입력하세요.',
			'mail.notexist': '&6받은 메일이 없습니다.',
			'mail.clear': '&6메일함을 비웠습니다.',
            'mail.send': '&6메일을 보냈습니다.',
			'mail.contents': '&6[&f%0%&6] &f%1%'
		)
	)
)

proc(_get_default_mails,
	return(
		array(
			'entrypoint': array('Test mail', 'Hello')
		)
	)
)

proc(_update_config,
	@config = import('chessentials.config')
	@new = _get_default_config()
	foreach(@key:@value in @new) {
		if(!array_index_exists(@config, @key)) {
			array_set(@config, @key, @value)
		}
	}
	_write_config(@config)
	export('chessentials.config', @config)
)

proc(_update_messages,
	@config = import('chessentials.messages')
	@new = _get_default_messages()
	foreach(@key:@value in @new) {
		if(!array_index_exists(@config, @key)) {
			array_set(@config, @key, @value)
		}
	}
	_write_messages(@config)
	export('chessentials.messages', @config)
)

proc(_save_mails,
	@mails = import('chessentials.mails')
	_write_mails(@mails)
)

proc(_load_config,
	if(!_has_config()) {
		_make_default_config()
	}

	if(!_has_messages()) {
		_make_default_messages()
	}
	
	if(!_has_mails()){
		_make_default_mails()
	}
	export('chessentials.messages', _read_messages())
	export('chessentials.config', _read_config())
	export('chessentials.mails', _read_mails())
	export('chessentials.chat.format', import('chessentials.config')[chat][format])
	export('chessentials.chat.length', import('chessentials.config')[chat][length])
	_update_config()
	_update_messages()
	_save_mails()
)