extends "res://Asset/Scripts/State/StateBase.gd"


var spawnDuration : float = 1.5
@export var VFXAnimationPlayer : AnimationPlayer



func state_update(_delta):
	spawnDuration -= _delta
	if spawnDuration <= 0:
		state_machine.switchTo("ChasePlayer")

func enter():
	super.enter()
	VFXAnimationPlayer.play("Spawn")
