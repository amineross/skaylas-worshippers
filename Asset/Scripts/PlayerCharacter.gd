class_name PlayerCharacter

extends CharacterBody3D

@onready var visual : Node3D = $VisualNode
@onready var animationPlayer : AnimationPlayer = $VisualNode/AnimationPlayer
@onready var footstepVFX : GPUParticles3D = $VisualNode/VFX/Footstep_GPUParticles3D

const SPEED = 5.0

var direction : Vector3
var rollkey_pressed : bool
var attackkey_pressed : bool
var maxHealth: int = 100
var currentHealth: int:
	set(new_value):
		currentHealth = new_value
		emit_signal("playerHealthUpdated", currentHealth, maxHealth)



var coinNumber: int:
	set(new_value):
		coinNumber = new_value
		emit_signal("coinNumberUpdated", coinNumber)

signal coinNumberUpdated(newValue)

signal playerHealthUpdated(newValue, maxValue)

func _ready():
	currentHealth = maxHealth

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= 1


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "up", "down")
	direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	rollkey_pressed = Input.is_action_just_pressed("roll")
	attackkey_pressed = Input.is_action_just_pressed("attack")
	
	move_and_slide()

func addCoin(value: int):
	coinNumber += value

func takeDamage(damage: int, enemy_position: Vector3):
	currentHealth -= damage
	currentHealth = clamp(currentHealth, 0, maxHealth)
	get_node("StateMachine").switchTo("Hurt")
	
	if get_node("StateMachine").currentState.name == "Hurt":
		get_node("StateMachine").currentState.pushBackDir = (global_position - enemy_position).normalized()
