extends "res://Asset/Scripts/State/StateBase.gd"

@export var footStepVFX : GPUParticles3D

func state_update(_delta):
	if character.direction:
		character.velocity.x = character.direction.x * character.SPEED
		character.velocity.z = character.direction.z * character.SPEED
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, character.SPEED)
		character.velocity.z = move_toward(character.velocity.z, 0, character.SPEED)
	
	if character.velocity.length() > 0.2:
		var lookDir = Vector2(character.velocity.z, character.velocity.x)
		character.visual.rotation.y = lookDir.angle()
	
	if character.attackkey_pressed:
		state_machine.switchTo("Attack")
	
	if character.rollkey_pressed:
		state_machine.switchTo("Roll")
	
	if character.direction == Vector3.ZERO:
		state_machine.switchTo("Idle")

func enter():
	super.enter()
	footStepVFX.emitting = true
	
func exit():
	super.exit()
	footStepVFX.emitting = false
