extends KinematicBody2D
class_name Paddle

export(float, 0.0, 10.0) var speed: float = 5
export(float, 0.0, 10.0) var acceleration: float = 2
export(float, 0.1, 5.0) var deceleration_multiplier := 2.0

onready var ball_reactor: PaddleBallReactor = $BallCollider
onready var input: InputNode = $Input

var velocity := Vector2()

func _process(delta: float) -> void:
	var c := input.get_control()
	
	var old_vel := velocity
	
	# We are decelerating
	if c == Vector2():
		c = -velocity.normalized() * deceleration_multiplier

		velocity += c * acceleration * delta
		
		# If this is the case, that means we have overshot durine
		if sign(old_vel.x) != sign(velocity.x) && sign(old_vel.y) != sign(velocity.y):
			velocity = Vector2()
	else:
		velocity += c * acceleration * delta
	
	
	velocity.x = clamp(velocity.x, -speed, speed)
	velocity.y = clamp(velocity.y, -speed, speed)
	
	var collision := move_and_collide(velocity)
	if collision:
		velocity = Vector2()
		
	ball_reactor.velocity = velocity
