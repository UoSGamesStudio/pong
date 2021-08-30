extends Control

export(NodePath) var _pth_focus_start: NodePath

var _paused := false
var _focus_start: Control

func _ready() -> void:
	visible = false
	_focus_start = get_node(_pth_focus_start)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		_paused = not _paused
		visible = _paused
		get_tree().paused = _paused
		_focus_start.grab_focus()


func _on_quit_button_down() -> void:
	Game.to_main_menu()
