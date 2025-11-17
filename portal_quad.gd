extends MeshInstance3D

var _mat


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_mat = get_active_material(0)
	if _mat == null:
		print_debug("Missing portal mat")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
