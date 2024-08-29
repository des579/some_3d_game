extends CharacterBody3D

@export var SPEED: float = 5
@export var JUMP_VELOCITY = 50

var GRAVITY: float = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	move(delta)

func move(delta: float):
	if not is_on_floor():
		velocity.y -= GRAVITY * delta / 10
	
	if Input.is_action_just_pressed("space"):
		velocity.y = JUMP_VELOCITY
	
	var input_dir = Input.get_vector("go_left", "go_right", "go_forward", "go_back")
	velocity.x = input_dir.x * SPEED
	velocity.z = input_dir.y * SPEED
	
	
	move_and_slide()
