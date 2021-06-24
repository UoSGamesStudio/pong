extends KinematicBody2D
class_name Ball

export var velocity := Vector2(2.0, 0.0)
onready var goal_scorer: GoalScorer = $GoalScorer

func get_goal_scorer() -> GoalScorer:
	return goal_scorer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collision := move_and_collide(velocity)
	
	if collision && collision.collider is BallReactor:
		var reactor := collision.collider as BallReactor
		velocity = reactor.on_ball_collision(velocity, collision.normal)
		move_and_collide(collision.remainder.length() * velocity.normalized())
		
