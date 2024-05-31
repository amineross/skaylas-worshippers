class_name StateMachine

extends Node

@export var initial_state = NodePath()
@onready var currentState : StateBase = get_node(initial_state)


# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		child.state_machine = self
		child.character = get_parent()
		child.animationPlayer = get_parent().get_node("VisualNode/AnimationPlayer")

		
	currentState.enter()

func _physics_process(delta):
	currentState.state_update(delta)

func switchTo(targetState: String):
	if ! has_node(targetState):
		print("Could not find target state")
		return
	
	currentState.exit()
	currentState = get_node(targetState)
	currentState.enter()
	
