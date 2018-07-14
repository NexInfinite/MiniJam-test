extends RigidBody2D

var movement = Vector2()
const MAX_SPEED = 300
const JUMP_HEIGHT = 200
const UP = Vector2(0, -1)

func get_inputs():
	if Input.is_key_pressed(KEY_H):
		movement = Vector2(MAX_SPEED, 0)
	elif Input.is_key_pressed(KEY_F):
		movement = Vector2(-MAX_SPEED, 0)
	elif Input.is_key_pressed(KEY_T):
		print('nein')
	else:
		movement = Vector2()
		
func _process(delta):
	get_inputs()
	
func _physics_process(delta): 
	var collisions = get_colliding_bodies()
	print(collisions)
	applied_force = movement
	