extends Control

onready var _visual_parent := $VisualParent

var _paused := false

func _ready() -> void:
	_visual_parent.visible = false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		_paused = not _paused
		_visual_parent.visible = _paused
		get_tree().paused = _paused
