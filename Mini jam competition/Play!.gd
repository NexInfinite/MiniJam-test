extends Node

export(String, FILE, "*.tscn") var level 

func _on_Button_pressed():
	get_tree().change_scene(level)
	pass 
