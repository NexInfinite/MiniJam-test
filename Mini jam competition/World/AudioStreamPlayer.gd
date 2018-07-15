extends AudioStreamPlayer

var song1
var song2

func _ready():
	set_process(true)
	song1 = self.get_stream()
	song2 = load('res://OpenArt/old city theme.ogg')
	self.play()
	
func _process(delta):
	if(self.is_playing() != true):
		if(self.get_stream() == song1):
			self.set_stream(song2)
		else:
			self.set_stream(song1)
		self.play()