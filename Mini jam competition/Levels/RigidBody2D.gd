extends RigidBody2D

export (int) var movement = Vector2(0, 0)

func get_inputs():
	if Input.is_key_pressed(KEY_H):
		movement = Vector2(100, 0)
	else:
		movement = Vector2(0, 0)
		
func _process(delta):
	get_inputs()
	
func _physics_process(delta):
	set_applied_force(movement)
	