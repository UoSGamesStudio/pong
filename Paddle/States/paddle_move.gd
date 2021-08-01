extends PaddleState

export(float, 0.0, 10.0) var speed := 5.0
export(float, 0.0, 100.0) var acceleration := 2.0

func execute(delta: float) -> void:
	var c := _input.get_control()
	if c == Vector2():
		return
	
	var vel := _fields.velocity
	vel = vel.move_toward(c * speed, acceleration * delta)
	
	"""
	vel += c * acceleration * delta
	
	vel.x = clamp(vel.x, -speed, speed)
	vel.y = clamp(vel.y, -speed, speed)
	"""
	_fields.velocity = vel
