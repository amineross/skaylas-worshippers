extends Node3D

@export var player : PlayerCharacter
@export var gameUIManger : GameUIManager

const mainMenuPath = "res://Asset/Scene/MainScene.tscn"

var paused: bool:
	set(new_value):
		paused = new_value
		gameUIManger.togglePauseUI(paused)
		get_tree().paused = paused

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		paused = true


func _on_button_restart_button_up():
	print("restart button")


func _on_button_main_menu_button_up():
	#for scene in get_tree().root.get_children():
		#scene.queue_free()
	get_tree().paused = false
	get_tree().change_scene_to_file(mainMenuPath)
		
func _on_button_resume_button_up():
	paused = false
