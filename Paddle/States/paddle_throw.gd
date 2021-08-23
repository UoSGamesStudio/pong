extends PaddleState

export(float, 0.1, 5.0) var _launch_speed := 2.0

func execute(_delta: float) -> void:
	if _fields.held_ball == null:
		return
		
	_fields.held_ball.position = _fields.ball_hold_position.global_position
	
	if not _input.get_attack().is_down():
		return
		
	var c := _input.get_control()
	if c == Vector2.ZERO:
		c = _fields.shooting_direction
		
	elif c.dot(_fields.shooting_direction) < 0:
		if sign(c.x) != sign(_fields.shooting_direction.x):
			c.x *= -1
		
		if sign(c.y) != sign(_fields.shooting_direction.y):
			c.y *= -1
	
	var vel := _fields.velocity
	
	
	_fields.held_ball.velocity = c * _launch_speed + vel
	_fields.held_ball = null
	_fields.anim_has_thrown = true
