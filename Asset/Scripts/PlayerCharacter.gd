class_name PlayerCharacter

extends CharacterBody3D

@onready var visual : Node3D = $VisualNode
@onready var animationPlayer : AnimationPlayer = $VisualNode/AnimationPlayer

@onready var footstepVFX : GPUParticles3D = $VisualNode/VFX/Footstep_GPUParticles3D

const SPEED = 5.0

var coinNumber: int:
	set(new_value):
		coinNumber = new_value
		emit_signal("coinNumberUpdated", coinNumber)

signal coinNumberUpdated(newValue)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= 1


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		animationPlayer.play("Run_v2")
		footstepVFX.emitting = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		animationPlayer.play("Idle_v2")
		footstepVFX.emitting = false
	
	if velocity.length() > 0.2:
		var lookDir = Vector2(velocity.z, velocity.x)
		visual.rotation.y = lookDir.angle()
	move_and_slide()

func addCoin(value: int):
	coinNumber += value
	print(coinNumber)
