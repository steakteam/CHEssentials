proc _mail_send(@message, @nickname) {
	if(_puuid(@nickname) != false) {
		if(!_has_user_data(@nickname, 'mail')) {
			@mail = array(@message)
		} else {
			@mail = _get_user_data(@nickname, 'mail')
			array_push(@mail, @message)
		}
		_set_user_data(@nickname, 'mail', yml_encode(@mail, true))
		return(true)
	} else {
		return(false)
	}
}

proc _mail_clear(@nickname) {
	if(_puuid(@nickname) != false) {
		_remove_user_data(@nickname, 'mail')
		return(true)
	} else {
		return(false)
	}
}

proc _mail_read(@nickname) {
	if(is_null(_get_user_data(@nickname, 'mail'))) {
		return(array())
	} else {
		return(_get_user_data(@nickname, 'mail'))
	}
}
proc _set_user_data(@nickname, @key, @value) {
	@uuid = _puuid(@nickname)
	if(@uuid == false) {
		return(false)
	}
	# Check Userdata File
	if(!file_exists('../../../../CHEssentials/') || !is_dir('../../../../CHEssentials/')) {
		create_dir('../../../../CHEssentials/')
	}
	if(!file_exists('../../../../CHEssentials/userdata') || !is_dir('../../../../CHEssentials/userdata')) {
		create_dir('../../../../CHEssentials/userdata')
	}
	if(!file_exists('../../../../CHEssentials/userdata/'.@uuid.'.yml') || !is_file('../../../../CHEssentials/userdata/'.@uuid.'.yml')) {
		create_file('../../../../CHEssentials/userdata/'.@uuid.'.yml')
	}
	@userdata = array()
	try(
		@userdata = yml_decode(read('../../../../CHEssentials/userdata/'.@uuid.'.yml'))
	)
	array_set(@userdata, @key, @value)
	write_file('../../../../CHEssentials/userdata/'.@uuid.'.yml', replace(yml_encode(@userdata, true), ': |', ': '), 'OVERWRITE')
}

proc _get_user_data(@nickname, @key) {
	@uuid = _puuid(@nickname)
	if(@uuid == false) {
		return(false)
	}
	# Check Userdata File
	if(!file_exists('../../../../CHEssentials/') || !is_dir('../../../../CHEssentials/')) {
		create_dir('../../../../CHEssentials/')
	}
	if(!file_exists('../../../../CHEssentials/userdata') || !is_dir('../../../../CHEssentials/userdata')) {
		create_dir('../../../../CHEssentials/userdata')
	}
	if(!file_exists('../../../../CHEssentials/userdata/'.@uuid.'.yml') || !is_file('../../../../CHEssentials/userdata/'.@uuid.'.yml')) {
		create_file('../../../../CHEssentials/userdata/'.@uuid.'.yml')
	}
	@userdata = array()
	try(
		@userdata = yml_decode(read('../../../../CHEssentials/userdata/'.@uuid.'.yml'))
	)
	if(array_index_exists(@userdata, @key)) {
		return(@userdata[@key])
	} else {
		return(null)
	}
}

proc _has_user_data(@nickname, @key) {
	@uuid = _puuid(@nickname)
	if(@uuid == false) {
		return(false)
	}
	# Check Userdata File
	if(!file_exists('../../../../CHEssentials/') || !is_dir('../../../../CHEssentials/')) {
		create_dir('../../../../CHEssentials/')
	}
	if(!file_exists('../../../../CHEssentials/userdata') || !is_dir('../../../../CHEssentials/userdata')) {
		create_dir('../../../../CHEssentials/userdata')
	}
	if(!file_exists('../../../../CHEssentials/userdata/'.@uuid.'.yml') || !is_file('../../../../CHEssentials/userdata/'.@uuid.'.yml')) {
		create_file('../../../../CHEssentials/userdata/'.@uuid.'.yml')
	}
	@userdata = array()
	try(
		@userdata = yml_decode(read('../../../../CHEssentials/userdata/'.@uuid.'.yml'))
	)
	return(array_index_exists(@userdata, @key))
}

proc _remove_user_data(@nickname, @key) {
	@uuid = _puuid(@nickname)
	if(@uuid == false) {
		return(false)
	}
	# Check Userdata File
	if(!file_exists('../../../../CHEssentials/') || !is_dir('../../../../CHEssentials/')) {
		create_dir('../../../../CHEssentials/')
	}
	if(!file_exists('../../../../CHEssentials/userdata') || !is_dir('../../../../CHEssentials/userdata')) {
		create_dir('../../../../CHEssentials/userdata')
	}
	if(!file_exists('../../../../CHEssentials/userdata/'.@uuid.'.yml') || !is_file('../../../../CHEssentials/userdata/'.@uuid.'.yml')) {
		create_file('../../../../CHEssentials/userdata/'.@uuid.'.yml')
	}
	@userdata = array()
	try(
		@userdata = yml_decode(read('../../../../CHEssentials/userdata/'.@uuid.'.yml'))
	)
	array_remove(@userdata, @key)
	write_file('../../../../CHEssentials/userdata/'.@uuid.'.yml', yml_encode(@userdata), 'OVERWRITE')
}

proc _puuid(@nickname) {
	if(ponline(@nickname)) {
		return(puuid(@nickname))
	}
	# Check Userdata File
	if(!file_exists('../../../../CHEssentials/') || !is_dir('../../../../CHEssentials/')) {
		create_dir('../../../../CHEssentials/')
	}
	if(!file_exists('../../../../CHEssentials/userlist.yml') || !is_file('../../../../CHEssentials/userlist.yml')) {
		create_file('../../../../CHEssentials/userlist.yml')
	}
	@userlist = array()
	try(
		@userlist = yml_decode(read('../../../../CHEssentials/userlist.yml'))
	)
	if(array_index_exists(@userlist, @nickname)) {
		return(@userlist[@nickname])
	} else {
		return(false)
	}
}

proc _add_puuid(@nickname, @uuid) {
	# Check Userdata File
	if(!file_exists('../../../../CHEssentials/') || !is_dir('../../../../CHEssentials/')) {
		create_dir('../../../../CHEssentials/')
	}
	if(!file_exists('../../../../CHEssentials/userlist.yml') || !is_file('../../../../CHEssentials/userlist.yml')) {
		create_file('../../../../CHEssentials/userlist.yml')
	}
	@userlist = array()
	try(
		@userlist = yml_decode(read('../../../../CHEssentials/userlist.yml'))
	)
	array_set(@userlist, @nickname, puuid(@nickname))
	write_file('../../../../CHEssentials/userlist.yml', yml_encode(@userlist), 'OVERWRITE')
}