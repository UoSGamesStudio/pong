extends Control

export(NodePath) var _stage_list_path: NodePath
export(NodePath) var _stage_display_path: NodePath

export(Array, PackedScene) var _temp_paddle_scenes: Array
export(PackedScene) var _temp_ball: PackedScene

onready var _anim_player: AnimationPlayer = $AnimationPlayer

var _stage_list: StageList
var _stage_preview: TextureRect

func _ready() -> void:
	_stage_list = get_node(_stage_list_path)
	_stage_preview = get_node(_stage_display_path)
	
	for row in _stage_list.icons:
		for icon in row:
			icon.connect("stage_highlighted", self, "_on_stage_highlighted")
			icon.connect("stage_selected", self, "_on_stage_selected")

func _on_stage_highlighted(ss_icon: StageSelectIcon) -> void:
	_stage_preview.texture = ss_icon.stage_preview_image
	_anim_player.play("stage_preview_popin")

func _on_stage_selected(ss_icon: StageSelectIcon) -> void:
	ScnNav.next_scene = ss_icon.scn_stage
	MngMatch.paddles_scenes = _temp_paddle_scenes
	MngMatch.ball_scene = _temp_ball
	SignalTower.emit_signal("proceed_to_next_scene")
