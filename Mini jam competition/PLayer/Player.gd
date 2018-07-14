extends RigidBody2D

var movement = Vector2()
var jump = false
var jump_anim = false
const MAX_JUMP_HEIGHT = -5000
const MAX_SPEED = 1000
const JUMP_SPEED_UP = -400
const JUMP_SPEED_DOWN = -600
const UP = Vector2(0, -1)
const ACCELERATION = 100

func _ready():
	set_contact_monitor(true)
	set_max_contacts_reported(3)
	connect("body_entered", self, "_on_floor_detected")
	set_mass(1)
	
func _on_floor_detected(body):
	var collisions_2 = body.get_name()
	print(collisions_2)
	print("Collision")
	if (body.get_name() == "Floor"):
		print((self.get_name()) + ' is hitting ' + (body.get_name()))
		jump = true
	elif (collisions_2 != "Floor"):
		jump = false

func get_inputs():
	var collisions = get_colliding_bodies()
	
	if Input.is_key_pressed(KEY_H):
		if movement.x < MAX_SPEED:
			movement.x += ACCELERATION
		elif movement.x > MAX_SPEED:
			movement.x = MAX_SPEED
	elif Input.is_key_pressed(KEY_F):
		if movement.x > MAX_SPEED:
			movement.x -= ACCELERATION
		elif movement.x < MAX_SPEED:
			movement.x = -MAX_SPEED
	elif Input.is_key_pressed(KEY_T):
		if jump == true:
			jump_anim = true
	else:
		movement.x = 0
		
	if jump_anim == true:
		movement.y += JUMP_SPEED_UP
		print(movement.y)
		
	if movement.y <= MAX_JUMP_HEIGHT:
			print('over jump height')
			jump = false
			jump_anim = false
	
	if jump == false:
		print('going down!')
		movement.y -= JUMP_SPEED_DOWN * 2
		set_mass(20)
			
	if movement.y > 0:
		movement.y = 0
		set_mass(1)
		
func _process(delta):
	get_inputs()
	
func _physics_process(delta): 
	applied_force = movement
