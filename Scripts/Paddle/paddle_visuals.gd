extends Node2D
class_name PaddleVisualController

export(NodePath) var _anim_player_path: NodePath
export(NodePath) var _fields_node_path: NodePath

export var _anim_on_attack := ""
export var _anim_throw := ""

var _fields: PaddleFields

var _anim_player: AnimationPlayer

func _ready() -> void:
	_anim_player = get_node(_anim_player_path)
	var f_node := get_node(_fields_node_path)
	if f_node.has_method("get_fields"):
		_fields = f_node.get_fields()
	else:
		print("Node %s at NodePath %s doesn't have a get_fields method" % [f_node.name, str(_fields_node_path)])
		_fields = PaddleFields.new()

func _process(_delta: float) -> void:
	if _fields.anim_has_thrown:
		_anim_player.play(_anim_throw)
		_fields.anim_has_thrown = false
