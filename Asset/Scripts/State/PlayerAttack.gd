extends "res://Asset/Scripts/State/StateBase.gd"

@export var hitBoxCollisionShape : CollisionShape3D

@export var attackEffectAnimationPlayer : AnimationPlayer
@export var attackVFX01 : Node3D
@export var hitVFX : GPUParticles3D

var damage: int = 40


func enableHitBox():
	hitBoxCollisionShape.disabled = false
	
func disableHitBox():
	
	hitBoxCollisionShape.disabled = true

func enter():
	print("Enter State ", name)
	animationPlayer.play(animationName, -1, 3)
	character.velocity.x = 0
	character.velocity.z = 0
	
	attackVFX01.visible = true
	attackEffectAnimationPlayer.stop()
	attackEffectAnimationPlayer.play("AttackVFX")

func exit():
	super.exit()
	disableHitBox()
	attackVFX01.visible = false

func state_update(_delta):
	if animationPlayer.is_playing() == false:
		state_machine.switchTo("Idle")


func _on_hit_box_body_entered(body):
	if body.is_in_group("Enemy"):
		body.applyDamage(damage)
		
		var position = body.global_position
		position.y = 1.5
		hitVFX.global_position = position
		hitVFX.restart()
