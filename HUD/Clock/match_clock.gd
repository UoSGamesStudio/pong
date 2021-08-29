extends NumDisplay

func _process(_delta: float) -> void:
	set_number(ceil(MngMatch.get_match_time_left()))
