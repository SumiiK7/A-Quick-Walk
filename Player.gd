extends CharacterBody3D

@export var speed := 7.0
@export var jump_strength := 20.0
@export var gravity := 50.0

var _working_velocity := Vector3.ZERO
var _snap_vector := Vector3.DOWN

@onready var _spring_arm: SpringArm3D = $SpringArm3D
@onready var _model: MeshInstance3D = $CharModel

func _physics_process(delta):
	var move_direction := Vector3.ZERO
	
	move_direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	move_direction.y = Input.get_action_strength("back") - Input.get_action_strength("forward")
	move_direction = move_direction.rotated(Vector3.UP, _spring_arm.rotation.y).normalized()
	
	_working_velocity.x = move_direction.x * speed
	_working_velocity.z = move_direction.y * speed
	_working_velocity.y -= gravity * delta
	
	set_velocity(_working_velocity)

	#var just_landed := is_on_floor() and _snap_vector == Vector3.ZERO
	#var is_jumping := is_on_floor() and Input.is_action_just_pressed("jump")
	#
	#if is_jumping:
		#_working_velocity.y = jump_strength
		#set_velocity(_working_velocity)
		#_snap_vector = Vector3.ZERO
	#elif just_landed:
		#_snap_vector = Vector3.DOWN
		
	#_velocity = move_and_slide_with_snap(_velocity, _snap_vector, Vector3.UP, true)
	move_and_slide()


















