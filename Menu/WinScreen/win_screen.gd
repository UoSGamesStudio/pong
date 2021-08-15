extends MarginContainer

onready var _winner_name: Label = $HBoxContainer/Control2/WinnerName

func _ready():
	_winner_name.text = "Player " + str(MngMatch.winning_player.id)

func _unhandled_key_input(event: InputEventKey) -> void:
	if event.is_pressed():
		ScnNav.emit_signal("to_main_menu")
