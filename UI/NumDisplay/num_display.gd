extends HBoxContainer
class_name NumDisplay

export(Array, Texture) var _number_textures: Array

onready var _tens: TextureRect = $CnTens/TRTens
onready var _units: TextureRect = $CnUnits/TRUnits

var _textures := {}

# Called when the node enters the scene tree for the first time.
func _ready():
	if _number_textures.size() < 10:
		print("Number Textures needs at least 10 textures")
	else:
		for i in range(_number_textures.size()):
			_textures[str(i)] = _number_textures[i]

func set_number(num: int) -> void:
	var number := str(num)
	if num > 9:
		_tens.texture = _textures[number[0]]
		_units.texture = _textures[number[1]]
	else:
		_units.texture = _textures[number[0]]
