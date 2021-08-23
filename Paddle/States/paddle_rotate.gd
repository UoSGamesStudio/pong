extends PaddleState

export(float, 0, 50) var rotation_accel := 5.0
export(float, 0, 90) var max_rotation := 50.0

func execute(delta: float) -> void:
	var c := _input.get_control()
	
	if _fields.is_dashing:
		delta *= 10
		c = _fields.dash_vector
	
	var to := 0
	if c != Vector2.ZERO:
		var perp := _fields.shooting_direction.rotated(PI / 2)
		to = perp.dot(c) * max_rotation
	_fields.rotation_degrees = move_toward(_fields.rotation_degrees, to, delta * rotation_accel)
	
	_fields.body_normal = _fields.shooting_direction.rotated(deg2rad(_fields.rotation_degrees))
