extends Button

export(String, FILE, "*.tscn") var start 

func _on_Button_pressed():
	get_tree().change_scene(start)
	pass 
