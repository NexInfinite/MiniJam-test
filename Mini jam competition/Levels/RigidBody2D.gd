extends RigidBody2D

const UP = Vector2(0, -1)
const GRAVITY = 25
const MAX_SPEED = 500
const ACCELERATION = 80
const JUMP_HEIGHT = -890
var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	
	if Input.is_key_pressed(KEY_H):
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
	elif Input.is_key_pressed(KEY_F):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
	else:
		friction = true
	
	if is_on_floor():
		if Input.is_key_pressed(KEY_T):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.4)
	else:
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	
	motion = move_and_slide(motion, UP)
	pass
