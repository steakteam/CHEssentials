proc _execute(@command, @array, @messages, @config) {
	if(array_size(@array) == 1) {
		if(is_array(pcursor()) && get_block_at(pcursor()) != '0:0') {
			switch(to_lower(@array[0])) {
				case 'tree':
					if(generate_tree(pcursor(), 'BIG_TREE'), 
					msg(_pm(@messages['bigtree.generated'], array(@messages['treetype.bigtree']))),
					msg(_pm(@messages['bigtree.notgenerated'], array(@messages['treetype.bigtree']))))
				case 'redwood':
					if(generate_tree(pcursor(), 'TALL_REDWOOD'),
					msg(_pm(@messages['bigtree.generated'], array(@messages['treetype.redwood']))),
					msg(_pm(@messages['bigtree.notgenerated'], array(@messages['treetype.redwood']))))
				case 'jungle':
					if(generate_tree(pcursor(), 'JUNGLE'),
					msg(_pm(@messages['bigtree.generated'], array(@messages['treetype.jungle']))),
					msg(_pm(@messages['bigtree.notgenerated'], array(@messages['treetype.jungle']))))
				case default:
					msg(_pm(@messages['bigtree.wronguse'], array(@command)))
			}
		} else {
			msg(_pm(@messages['bigtree.notground']))
		}
	} else {
		msg(_pm(@messages['bigtree.wronguse'], array(@command)))
	}
}

proc _has_permission() {
	return(has_permission(player(), 'che.command.bigtree'))
}

proc _command() {
	return(array('bigtree', 'largetree')) # Commands in array
} 