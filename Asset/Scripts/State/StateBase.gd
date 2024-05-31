class_name StateBase

extends Node


var state_machine : StateMachine
var character : CharacterBody3D
var animationPlayer : AnimationPlayer

@export var animationName : String = ""

func enter():
	#print("Enter State ", name)
	animationPlayer.play(animationName)
	pass

func exit():
	#print("Exit State ", name)
	pass

func state_update(_delta):
	pass

func showInfo():
	print(name,'/',character,'/',state_machine)
