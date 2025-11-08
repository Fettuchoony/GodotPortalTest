extends CSGCylinder3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_FORWRD):
		translate(Vector3.FORWARD)
	if Input.is_key_pressed(KEY_LEFT):
		translate(Vector3.LEFT)
	if Input.is_key_pressed(KEY_RIGHT):
		translate(Vector3.RIGHT)
	if Input.is_key_pressed(KEY_BACK):
		translate(Vector3.BACK)
