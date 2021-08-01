extends Node
class_name DbBallManager
"""
class DbBallManager
Responsible for DbBall nodes
"""

export(PackedScene) var scn_db_ball : PackedScene

var _db_ball_instances := []
var _main : Node

func _ready() -> void:
	pass
	# Should extend here with code to find nodes that aren't autoloads

func _on_stage_loaded() -> void:
	var db_ball_index := -1
	
	for child in ExNode.get_all_children(get_tree().root):
		if child is Ball:
			db_ball_index += 1
			var db_ball: DbBall
			if db_ball_index >= _db_ball_instances.size():
				db_ball = scn_db_ball.instance()
				add_child(db_ball)
				_db_ball_instances.append(db_ball)
			else:
				db_ball = _db_ball_instances[db_ball_index]
			
			db_ball.set_ball(child)
	
	# Remove redundant DbBall
	for i in range(_db_ball_instances.size() - 1, db_ball_index, -1):
		remove_child(_db_ball_instances[i])
		_db_ball_instances.remove(i)
