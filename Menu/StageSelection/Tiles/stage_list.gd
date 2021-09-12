extends Control
class_name StageList

const PATH_START := "../../%s/%s"

onready var _icons_gparent := $VBIcons

var icons: Array
var _icon_paths: Array

func _ready() -> void:
	for icon_parent in _icons_gparent.get_children():
		icons.append([])
		var i := icons.size() - 1
		for icon in icon_parent.get_children():
			icons[i].append(icon)

# An attempt to wire up the icons by script
# Will just do it manually for now
"""
func _ready() -> void:
	var hbox_names := []
	var vert_limit := icons.size() - 1
	for i in range(vert_limit + 1):
		var hori_limit: int = icons[i].size() - 1
		for j in range(hori_limit + 1):
			# i - the row
			# j - the column
			
			if i != 0:
				var neighbour_index := _find_vertical_focus_neighbour(i, icons.size(), icons[i - 1].size())
				icons[i][j].focus_neighbour_top = PATH_START % [hbox_names[i - 1], icons[i - 1][neighbour_index].name]
			if i != vert_limit:
				var neighbour_index := _find_vertical_focus_neighbour(i, icons.size(), icons[i + 1].size())
				icons[i][j].focus_neighbour_bottom = PATH_START % [hbox_names[i + 1], icons[i + 1][j].name]
			
			if j != 0:
				icons[i][j].focus_neighbour_left = PATH_START % [hbox_names[i], icons[i][j - 1].name]
			if j != hori_limit:
				icons[i][j].focus_neighbour_right = PATH_START % [hbox_names[i], icons[i][j + 1].name]
	
	$VBIcons/HBIcons/Icon2.grab_focus()

func _find_vertical_focus_neighbour(index: int, from_row_size: int, to_row_size: int) -> int:
	if from_row_size == to_row_size:
		return index
	
	if from_row_size > to_row_size:
		var dist := abs(index - (from_row_size / 2))
		if dist > (to_row_size / 2):
			index = to_row_size - 1 if index > (from_row_size / 2) else 0
		else:
			index = int(dist * sign(index - (from_row_size / 2)) + (to_row_size))
			index -= 1
	
	return index
"""
