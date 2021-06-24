extends PaddleState

export(float, 0.1, 5.0) var _launch_speed := 2.0

func execute(_delta: float) -> void:
	if _fields.held_ball == null:
		return
		
	_fields.held_ball.position = _fields.ball_hold_position.global_position
	
	if not _input.get_attack().is_down():
		return
		
	var c := _input.get_control()
	var dot := c.dot(_fields.shooting_direction)
	if dot < 0:
		if sign(c.x) != sign(_fields.shooting_direction.x):
			c.x *= -1
		
		if sign(c.y) != sign(_fields.shooting_direction.y):
			c.y *= -1
	
	_fields.held_ball.velocity = c * _launch_speed
	_fields.held_ball = null
	
