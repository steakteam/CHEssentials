proc _write_file_in_folder(@filename, @string) {
	if(!file_exists('../../../../CHEssentials/') || !is_dir('../../../../CHEssentials/')) {
		create_dir('../../../../CHEssentials/')
	}
	if(!file_exists('../../../../CHEssentials/'.@filename) || !is_file('../../../../CHEssentials/'.@filename)) {
		create_file('../../../../CHEssentials/'.@filename)
	}
	write_file('../../../../CHEssentials/'.@filename, @string, 'OVERWRITE')
}

proc _read_file_in_folder(@filename) {
	if(!file_exists('../../../../CHEssentials/') || !is_dir('../../../../CHEssentials/')) {
		create_dir('../../../../CHEssentials/')
	}
	if(!file_exists('../../../../CHEssentials/'.@filename) || !is_file('../../../../CHEssentials/'.@filename)) {
		create_file('../../../../CHEssentials/'.@filename)
	}
	return(read('../../../../CHEssentials/'.@filename))
}

proc _create_file_test(@file) {
	create_file(@file)
}

proc _file_exists_test(@file) {
	msg(file_exists(@file))
}

proc _read_config() {
	@yml = _read_file_in_folder('config.yml')
	return(yml_decode(@yml))
}

proc _read_messages(@locale = '') {
	if(@locale != '' && file_exists('../../../../CHEssentials/messages_'.@locale.'.properties')) {
		@properties = _read_file_in_folder('messages_'.@locale.'.properties')
	} else {
		@properties = _read_file_in_folder('messages.properties')
	}
	
	return(ini_decode(@properties))
}

proc _write_config(@configArray) {
	_write_file_in_folder('config.yml', yml_encode(@configArray, true))
}

proc _write_messages(@messageArray) {
	_write_file_in_folder('messages.properties', ini_encode(@messageArray))
}

proc _has_config() {
	return(file_exists('../../../../CHEssentials/config.yml'))
}

proc _has_messages() {
	return(file_exists('../../../../CHEssentials/messages.properties'))
}

proc _make_default_config() {
	_write_config(_get_default_config())
}

proc _get_default_config() {
	return(
		array(
			'chat':array('format': '<{DISPLAYNAME}> {MESSAGE}', 'radius':'0'),
			'locale':'default',
			'heal-cooldown': 0,
			'feed-cooldown': 0,
			'auto-afk': 300,
			'auto-afk-kick': -1
		)
	)
}

proc _make_default_messages() {
	_write_messages(_get_default_messages())
}

proc _make_default_mails() {
	_write_mails(_get_default_mails())
}

proc _get_default_messages() {
	return(
		array(
			'wronguse': '&c사용법: {0}',
			'noperm': '&c이것을 실행할 권한이 없습니다!',
			'teleporting': '&6텔레포트 중 입니다..',
			'gamemode.changed':'&c{0} &6님의 게임 모드가 &c{1} &6으로 변경되었습니다.',
			'noonline': '&c그 플레이어는 온라인이 아닙니다!',
			'gamemode.wronguse': '&c사용법:/{0} [게임모드] [플레이어]',
			'heal.wronguse': '&c사용법:/{0} [플레이어]',
			'heal.healed': '&c{0} &6님이 회복되었습니다.',
			'heal.healed.myself': '&6회복되었습니다.',
			'feed.feeded.myself': '&6배고픔이 해결되었습니다.',
			'feed.noperm.others': '&c다른 사람의 배고픔을 채울 권한이 없습니다!',
			'top.gototop': '&6최상층으로 이동하였습니다.',
			'top.notop': '&c더이상 위로 올라갈 수 없습니다!',
			'infotool.clicked': '&6당신이 클릭한 블록은 &c{0} &6입니다.\n&6이 도구의 사용을 중지하려면 &c/infotool &6을 다시 입력하세요.',
			'infotool.activated': '&cinfotool&6이 아이템 &c{0} &6에 등록되었습니다. 사용을 중지하시려면 &c/infotool &6을 한번 더 입력해 주세요.',
			'infotool.deactivated': '&cinfotool&6이 꺼졌습니다. 다시 사용하시려면 &c/infotool &6을 한번 더 입력해 주세요.',
			'infotool.noheld': '&cinfotool 를 사용하기 위해서는 손에 무언가를 들고 있어야 합니다.',
			'time.wronguse': '&c사용법:/{0} [시간] or /{0} [Set | Add] [시간]',
			'time.settime': '&6시간이 {0} 으로 설정되었습니다.',
			'sky.wronguse': '&c사용법:/{0} [sun|rain]',
			'sky.changesky': '&6날씨가 {0} 으로 바뀌었습니다.',
			'lightning.wronguse': '&c사용법:/{0} (플레이어)',
			'lightning.smite': '&6번개가 {0}, {1}, {2} 에 떨어졌습니다.',
			'kick.wronguse': '&c사용법:/{0} [플레이어]',
			'kick.defaultmsg': '&c당신은 킥 되셨습니다.',
			'kick.sucmsg': '당신은 {0} 님을 킥하셨습니다.',
			'getpos.wronguse': '&c사용법:/{0} (플레이어)',
			'getpos.printmsg': '&6{0} 님의 위치는 &a( {1}, {2}, {3}, {4} )&6 입니다.',
			'tell.wronguse': '&c사용법:/{0} [플레이어] [할말]',
			'tell.sameperson': '&c자신에게는 메세지를 보낼 수 없습니다.',
			'reply.wronguse': '&c사용법:/{0} [할말]',
			'reply.noplayer': '&c답장을 보낼 상대가 없습니다.',
			'killall.help': '&c사용법:/{0} [월드]',
			'killall.complete': '&d{0} 마리의 엔티티들이 제거되었습니다.',
			'tppos.wronguse': '&c사용법: /{0} (x) (y) (z)',
			'fly.toggle': '&6플레이어 &f{0} &6의 비행 모드를 {1} &6시켰습니다.',
			'fly.true': '&c활성화',
			'fly.false': '&c비활성화',
			'chessentials.usage': '&c사용법: /{0} <reload>',
			'chessentials.reloaded': '&6CHEssentials 버전 {0} 리로드됨.',
			'mail.list': ' &e---- &6메일: 읽기 &e-- &6페이지 &c{0}&6/&c{1} &e----\n&f{2}\n&6메일을 지우시려면 &c/mail clear &6를 입력하세요.',
			'mail.notexist': '&6받은 메일이 없습니다.',
			'mail.clear': '&6메일함을 비웠습니다.',
            'mail.send': '&6메일을 보냈습니다.',
			'mail.contents': '&6[&f{0}&6] &f{1}',
			'mail.wronguse': '&c사용법: /{0} [read|clear|send] [to] [message]|sendall [message]',
			'mail.unread': '&6읽지 않은 메일이 &c{0} &6개 있습니다. 읽으시려면 &c/mail read &6를 입력하세요.',
			'mail.noreciver': '&c해당 유저는 존재하지 않습니다.',
            'suicided': '&6자살했습니다.',
			'outtell':'&6[&c{0}&6 -> &c{1}&6] &r{2}',
			'receivetell':'&6[&c{0}&6 -> &c{1}&6] &r{2}',
			'break.nosight':'&c보고있는 블록이 없습니다!',
			'break.nobedrock':'&c기반암은 부술 수 없습니다!',
			'break.sucess':'&6블록을 부쉈습니다.',
			'bigtree.wronguse': '&c사용법: /{0} <tree|redwood|jungle>',
			'bigtree.notground': '&c나무는 땅에만 설치할 수 있습니다!',
			'bigtree.generated': '&c{0} &6가 생성되었습니다.',
			'bigtree.notgenerated': '&4{0} &c가 생성되지 않았습니다!',
			'treetype.bigtree': '참나무',
			'treetype.redwood': '가문비나무',
			'treetype.jungle': '정글 나무',
			'feed.wronguse': '&c사용법:/{0} [플레이어]',
			'feed.feeded': '&c{0} &6님의 배고픔이 해결되었습니다.',
			'feed.feeded.myself': '&6배고픔이 해결되었습니다.',
			'feed.noperm.others': '&c다른 사람의 배고픔을 채울 권한이 없습니다!',
			'command.cooldown': '&c{0} &6초 후에 이 명령어를 다시 사용하실 수 있습니다.',
			'afk.on': '&r{0} &6님이 &cAFK &6상태가 되셨습니다.',
			'afk.off': '&r{0} &6님이 &cAFK &6상태를 해제하셨습니다.',
			'afk.kicked': '&cAFK &6상태를 너무 오래 유지하여 서버에서 추방되셨습니다!',
			'afk.wronguse.withothers': '&c사용법: /{0} [플레이어]',
			'afk.wronguse': '&c사용법: /{0}'
		)
	)
}

proc _update_config() {
	@config = import('chessentials.config')
	@new = _get_default_config()
	foreach(@key:@value in @new) {
		if(!array_index_exists(@config, @key)) {
			array_set(@config, @key, @value)
		}
	}
	_write_config(@config)
	export('chessentials.config', @config)
}

proc _update_messages() {
	@config = import('chessentials.messages')
	@new = _get_default_messages()
	foreach(@key:@value in @new) {
		if(!array_index_exists(@config, @key)) {
			array_set(@config, @key, @value)
		}
	}
	_write_messages(@config)
	export('chessentials.messages', @config)
}

proc _load_config() {
	if(!_has_config()) {
		_make_default_config()
	}

	if(!_has_messages()) {
		_make_default_messages()
	}
	export('chessentials.config', _read_config())
	if(import('chessentials.config')[locale] != 'default') {
		export('chessentials.messages', _read_messages(import('chessentials.config')[locale]))
	} else {
		export('chessentials.messages', _read_messages())
	}
	_update_config()
	_update_messages()
	# Reset AFK Timer
	foreach(@player in all_players()) {
		if(import('chessentials.config')['auto-afk'] != '-1') {
			if(import(@player.'.autoafktimer') == 'afk') {
				broadcast(_pm(import('chessentials.messages')['afk.off'], array(@player)))
			}
			export(@player.'.autoafktimer', import('chessentials.config')['auto-afk'])
		}
		if(import('chessentials.config')['auto-afk-kick'] != '-1') {
			export(@player.'.autoafkkicktimer', import('chessentials.config')['auto-afk-kick'])
		}
	}
}