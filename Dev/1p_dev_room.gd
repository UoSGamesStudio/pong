extends Node

var _paddles := []
var _stage: Stage

func _ready() -> void:
	for p in $Paddles.get_children():
		_paddles.append(p)
	
	_stage = $StageParent.get_child(0)
	_stage.set_paddles(_paddles)
	
	_paddles[0].hold_ball($Ball/Ball)

