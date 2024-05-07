extends CharacterBody3D


@export var gravity := 50.0
@export var SPEED := 8.0
@export var jump_force := 20.0
@export var health := 10

@onready var spring_arm: SpringArm3D = $Node3D/SpringArm3D
@onready var mesh : MeshInstance3D = $MeshInstance3D

var angular_acceleration := 7
var isAlive := true
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	direction = direction.rotated(Vector3.UP, spring_arm.rotation.y).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()


func _on_get_food_area_entered(area):
	if area.is_in_group("apple"):
		area.get_parent().queue_free()
		$PlayerNeeds.eat(100) # Replace with function body.
