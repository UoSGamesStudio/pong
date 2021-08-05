extends Control

onready var _num_display: NumDisplay = $NumDisplay

func _process(_delta: float) -> void:
	_num_display.set_number(ceil(MngMatch.get_match_time_left()))
