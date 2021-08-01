extends MarginContainer

export(NodePath) var _starting_control: NodePath

export(PackedScene) var _offline_next_screen: PackedScene


func _ready():
	if not _starting_control.is_empty():
		var control: Node = get_node(_starting_control)
		if control is Control:
			control.grab_focus()


func _on_Quit_button_down():
	get_tree().quit()


func _on_Settings_button_down():
	pass # Replace with function body.


func _on_Offline_button_down():
	ScnNav.next_scene = _offline_next_screen
	SignalTower.emit_signal("proceed_to_next_scene")
