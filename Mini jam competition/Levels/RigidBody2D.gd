extends RigidBody2D

var movement = Vector2()

func get_inputs():
	if Input.is_key_pressed(KEY_H):
		movement = Vector2(100, 0)
	else:
		movement = Vector2()
		
func _process(delta):
	get_inputs()
	
func _physics_process(delta):
	add_force(Vector2(), movement)
	pass