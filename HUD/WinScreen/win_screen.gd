extends Control

onready var _winner_name: Label = $HBoxContainer/Control2/WinnerName

func _ready():
	MngMatch.connect("match_finished", self, "_on_match_finished")
	set_process_unhandled_key_input(false)
	visible = false

func _unhandled_key_input(event: InputEventKey) -> void:
	if event.is_pressed():
		Game.to_main_menu()

func _on_match_finished() -> void:
	_winner_name.text = "Player " + str(MngMatch.winning_player.id)
	set_process_unhandled_key_input(true)
	visible = true
