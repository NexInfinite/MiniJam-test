extends RigidBody2D

var movement = Vector2()
const MAX_SPEED = 300

func get_inputs():
	if Input.is_key_pressed(KEY_H):
		movement = Vector2(MAX_SPEED, 0)
	else:
		movement = Vector2()
		
func _process(delta):
	get_inputs()
	
func _physics_process(delta): 
	applied_force = movement
	print(applied_force)
	