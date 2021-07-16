extends MarginContainer

export(NodePath) var _starting_control: NodePath


func _ready():
	if not _starting_control.is_empty():
		var control: Node = get_node(_starting_control)
		if control is Control:
			control.grab_focus()


func _on_Quit_button_down():
	get_tree().quit()


func _on_Settings_button_down():
	pass # Replace with function body.
