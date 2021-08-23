extends PaddleState


func execute(delta: float) -> void:
	if _fields.held_ball != null:
		return
	
	if _input.get_attack().is_down():
		_fields.anim_punch = true
