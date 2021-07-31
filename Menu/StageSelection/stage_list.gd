extends Control
class_name StageList

const PATH_START := "../../%s/%s"

onready var _icons_gparent := $VBIcons

var icons: Array
var _icon_paths: Array

func _ready() -> void:
	var hbox_names := []
	for icon_parent in _icons_gparent.get_children():
		icons.append([])
		hbox_names.append(icon_parent.name)
		var i := icons.size() - 1
		for icon in icon_parent.get_children():
			icons[i].append(icon)
	
	var vert_limit := icons.size() - 1
	for i in range(vert_limit + 1):
		var hori_limit: int = icons[i].size() - 1
		for j in range(hori_limit):
			if i != 0:
				icons[i][j].focus_neighbour_top = PATH_START % [hbox_names[i - 1], icons[i - 1][j].name]
			if i != vert_limit:
				icons[i][j].focus_neighbour_bottom = PATH_START % [hbox_names[i + 1], icons[i + 1][j].name]
			
			if j != 0:
				icons[i][j].focus_neighbour_left = PATH_START % [hbox_names[i], icons[i][j - 1].name]
			if j != hori_limit:
				icons[i][j].focus_neighbour_right = PATH_START % [hbox_names[i], icons[i][j + 1].name]
	
	# $VBIcons/HBIcons/IconDevStage.grab_focus()
