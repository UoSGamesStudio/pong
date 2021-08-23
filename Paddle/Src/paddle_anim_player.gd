extends AnimationPlayer

export(NodePath) var _fields_node_path: NodePath

export var _anim_attack := ""
export var _anim_throw := ""

var _fields: PaddleFields

func _ready() -> void:
	_fields = PaddleHelper.find_fields_from_path(self, _fields_node_path)

func _process(_delta: float) -> void:
	if _fields.anim_has_thrown:
		play(_anim_throw)
		_fields.anim_has_thrown = false
	
	if _fields.anim_punch:
		play(_anim_attack)
		_fields.anim_punch = false
