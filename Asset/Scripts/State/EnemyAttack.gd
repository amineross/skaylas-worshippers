extends "res://Asset/Scripts/State/StateBase.gd"

@export var hitBoxCollisionShape : CollisionShape3D
var lookDir : Vector3
var lookDir2D : Vector2
var damage: int = 30

func state_update(_delta):
	if animationPlayer.is_playing() == false:
		state_machine.switchTo("ChasePlayer")
	if character.currentHealth == 0:
		state_machine.switchTo("Dead")
	
func enableHitBox():
	hitBoxCollisionShape.disabled = false
	
func disableHitBox():
	hitBoxCollisionShape.disabled = true
	
func enter():
	super.enter()
	character.velocity = Vector3.ZERO
	
	lookDir = character.player.global_position - character.global_position
	lookDir2D = Vector2(lookDir.z, lookDir.x)
	character.visual.rotation.y = lookDir2D.angle()
	
func exit():
	super.exit()
	disableHitBox()


func _on_hit_box_body_entered(body):
	if body.is_in_group("Player"):
		body.takeDamage(damage, character.global_position)
