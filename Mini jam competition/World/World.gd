extends Node

var is_camera_shaking = false
var camera_postition
var red_boss_position
var zoom_x = 0.5
var zoom_y = 0.5

func shake_camera():
	if is_camera_shaking:
		return
	is_camera_shaking = true
	$"PLayer - Green guy/Camera2D".set_zoom(Vector2(zoom_x, zoom_y))
	is_camera_shaking = false
	
func _physics_process(delta):
	camera_postition = $"PLayer - Green guy/Camera2D".get_camera_position()
	red_boss_position = $"Read boss".get_global_position()
	if red_boss_position.y - camera_postition.y <= 380:
		if zoom_x > 0.4:
			zoom_x -= 0.005
			zoom_y -= 0.005
			shake_camera()
		else:
			shake_camera()
	else:
		if zoom_x < 0.7 and zoom_y < 0.7:
			zoom_x += 0.02
			zoom_y += 0.02
			shake_camera()
	
	pass
