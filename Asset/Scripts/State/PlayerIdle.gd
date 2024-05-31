extends "res://Asset/Scripts/State/StateBase.gd"


func state_update(_delta):
	if character.attackkey_pressed:
		state_machine.switchTo("Attack")
	if character.rollkey_pressed:
		state_machine.switchTo("Roll")
	if character.direction:
		state_machine.switchTo("Run")
