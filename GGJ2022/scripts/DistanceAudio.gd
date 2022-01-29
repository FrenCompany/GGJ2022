extends Node2D


export(AudioStream) var audio_stream
export(Vector2) var listener_pos
export var max_dist = 2000
export var min_dist = 200

var min_volume_db = -80
var max_volume_db = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.stream = audio_stream
	$Player.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var listener_dist = self.listener_pos.distance_to(self.position)
	listener_dist = max( min(max_dist, listener_dist), min_dist )
	
	var volume = 1 - (listener_dist / (max_dist - min_dist))
	$Player.volume_db = (max_volume_db - min_volume_db) * volume + min_volume_db
	

# setters
func set_listener_pos(new_pos):
	self.listener_pos = new_pos
