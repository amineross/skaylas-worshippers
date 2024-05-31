extends CharacterBody3D


const SPEED = 0.5

@onready var navAgent: NavigationAgent3D = $NavigationAgent3D
var player: Node3D
@onready var visual: Node3D = $VisualNode
@onready var animationPlayer: AnimationPlayer = $VisualNode/AnimationPlayer
@onready var VFXAnimationPlayer: AnimationPlayer = $VisualNode/VFXAnimationPlayer

var direction: Vector3


var maxHealth: int = 100
var currentHealth: int

func _ready():
	player = get_tree().get_first_node_in_group("Player")
	currentHealth = maxHealth
	
func _physics_process(delta):
	
	move_and_slide()

func applyDamage(damage: int):
	currentHealth -= damage
	currentHealth = clamp(currentHealth, 0, maxHealth)
	VFXAnimationPlayer.play("Flash")
