extends Area2D

var pos = Vector2()
export (float) var speed 
export(String, FILE, "*.tscn") var death 

func _ready():
	pos = get_global_position()
	print(pos)

func _process(delta):
	pos.y -= speed
	speed += 0.005
	set_global_position(pos)
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "PLayer - Green guy":
			get_tree().change_scene(death)
	pass
