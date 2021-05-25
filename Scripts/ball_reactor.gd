extends StaticBody2D
class_name BallReactor


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func on_ball_collision(velocity: Vector2, normal: Vector2):
	
	return velocity.bounce(normal)
