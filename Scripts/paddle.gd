extends KinematicBody2D
class_name Paddle

export(float, 0.0, 10.0) var speed: float = 5
export(float, 0.0, 10.0) var acceleration: float = 2
export(float, 0.1, 5.0) var deceleration_multiplier := 2.0

onready var input := $Input

var velocity := Vector2()

func _process(delta: float) -> void:
	var c = input.get_control()
	
	if c == Vector2():
		c = -velocity.normalized() * deceleration_multiplier
		

	velocity += c * acceleration * delta
	velocity.x = clamp(velocity.x, -speed, speed)
	velocity.y = clamp(velocity.y, -speed, speed)
	
	var collision := move_and_collide(velocity)
	if collision:
		velocity = Vector2()
