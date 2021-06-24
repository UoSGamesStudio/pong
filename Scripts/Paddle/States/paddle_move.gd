extends PaddleState

export(float, 0.0, 10.0) var speed := 5.0
export(float, 0.0, 10.0) var acceleration := 2.0
export(float, 0.1, 5.0) var deceleration_multiplier := 2.0

func execute(delta: float) -> void:
	var c := _input.get_control()
	
	var vel := _fields.velocity
	var old_vel := vel
	
	# We are decelerating
	if c == Vector2():
		c = -vel.normalized() * deceleration_multiplier

		vel += c * acceleration * delta
		
		# If this is the case, that means we have overshot durine
		if sign(old_vel.x) != sign(vel.x) && sign(old_vel.y) != sign(vel.y):
			vel = Vector2()
	else:
		vel += c * acceleration * delta
	
	vel.x = clamp(vel.x, -speed, speed)
	vel.y = clamp(vel.y, -speed, speed)
	_fields.velocity = vel
