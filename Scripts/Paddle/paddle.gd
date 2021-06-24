extends KinematicBody2D
class_name Paddle

export(float, 0.0, 10.0) var speed: float = 5
export(float, 0.0, 10.0) var acceleration: float = 2
export(float, 0.1, 5.0) var deceleration_multiplier := 2.0

onready var _ball_reactor: PaddleBallReactor = $BallCollider
onready var _input: InputNode = $Input

var _velocity := Vector2()

func set_input(input: String) -> void:
	_input.keyboard_input_index = input

func _process(delta: float) -> void:
	var c := _input.get_control()
	
	var old_vel := _velocity
	
	# We are decelerating
	if c == Vector2():
		c = -_velocity.normalized() * deceleration_multiplier

		_velocity += c * acceleration * delta
		
		# If this is the case, that means we have overshot durine
		if sign(old_vel.x) != sign(_velocity.x) && sign(old_vel.y) != sign(_velocity.y):
			_velocity = Vector2()
	else:
		_velocity += c * acceleration * delta
	
	
	_velocity.x = clamp(_velocity.x, -speed, speed)
	_velocity.y = clamp(_velocity.y, -speed, speed)
	
	var collision := move_and_collide(_velocity)
	if collision:
		_velocity = Vector2()
		
	_ball_reactor.velocity = _velocity
