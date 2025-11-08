extends CharacterBody3D

@onready var _camera = $ThirdPersonCamera

const SPEED = 5.0
const JUMP_VELOCITY = 4.5


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_pressed("Escape"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

	# Get the input direction and handle the movement/deceleration.aaada
	# As good practice, you should replace UI actions with custom gameplay actions.
	var cam_right = _camera.get_right_direction()
	var cam_back = _camera.get_back_direction()
	var input_dir := Input.get_vector("Left", "Right", "Up", "Down")
	#var direction := (transform.basis * Vector3(input_dir.x * (cam_left + cam_right).x, 0, input_dir.y * (cam_front + cam_back).z)).normalized()
	var direction := (transform.basis * (input_dir.x) * Vector3(cam_right)).normalized()
	direction += (transform.basis * (input_dir.y) * Vector3(cam_back)).normalized()

	# Fix movement to change with camera
	if direction:
		
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED

	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
