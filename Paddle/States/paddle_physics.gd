extends PaddleState

export(float, 0.1, 5.0) var traction := 2.0

func execute(_delta: float) -> void:
	var c := _input.get_control()
	if c != Vector2():
		return
	
	var vel := _fields.velocity
	var old_vel := vel
	
	vel -= vel.normalized() * traction * _delta
	
	# If this is the case, that means we have overshot durine
	if sign(old_vel.x) != sign(vel.x) && sign(old_vel.y) != sign(vel.y):
		vel = Vector2()
		
	_fields.velocity = vel
