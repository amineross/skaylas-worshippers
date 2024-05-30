extends Control

const mainGamePath: String = "res://Asset/Scene/main.tscn"

func _on_button_start_button_up():
	get_tree().change_scene_to_file(mainGamePath)
		


func _on_button_quit_button_up():
	get_tree().quit()
