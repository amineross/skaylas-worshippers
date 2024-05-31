extends "res://Asset/Scripts/State/StateBase.gd"

var rollSpeed : float = 600
var rollDuration : float = 0.6
var remainRollDuration : float
var facingDir : Vector3
var additionalDistance : float = 0

func enter():
	print("Enter State ", name)
	animationPlayer.play(animationName, -1, 3)
	character.velocity.x = 0
	character.velocity.z = 0
	remainRollDuration = rollDuration
	
func state_update(_delta):
	remainRollDuration -= _delta
	facingDir = character.visual.transform.basis.z
	
	if remainRollDuration > 0:
		character.velocity.x = facingDir.x * rollSpeed * _delta
		character.velocity.z = facingDir.z * rollSpeed * _delta
	else:
		character.velocity.x = 0
		character.velocity.z = 0
		character.transform.origin += facingDir * additionalDistance
		state_machine.switchTo("Idle")
