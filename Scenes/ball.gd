extends KinematicBody2D
class_name Ball

export var velocity := Vector2(2.0, 0.0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_collide(velocity)
