extends RigidBody2D

func _physics_process(delta):
	var collisions = get_colliding_bodies()
	print(collisions)
	if 'Player' in collisions:
		print('working')
	pass
